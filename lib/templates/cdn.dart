class CDN {
  final String templateString = '''
AWSTemplateFormatVersion: '2010-09-09'
Description: '(Cloudfront-as-default-00) Simple CloudFront distribution with an S3 origin'

Resources:
  S3Bucket:
    DeletionPolicy: 'Delete'
    Metadata:
      Comment: 'Bucket to store some data'
    Properties:
      AccessControl: 'Private'
      BucketName: !Sub 'cf-simple-s3-origin-{AWS::StackName}-{AWS::AccountId}'
    Type: 'AWS::S3::Bucket'

  S3BucketPolicy:
    Metadata:
      Comment: 'Bucket policy to allow cloudfront to access the data'
    Properties:
      Bucket: !Ref S3Bucket
      PolicyDocument:
        Statement:
          - Action:
              - 's3:GetObject'
            Effect: 'Allow'
            Principal:
              CanonicalUser: !GetAtt CfOriginAccessIdentity.S3CanonicalUserId
            Resource:
              - !Sub 'arn:aws:s3:::S3Bucket/*'
    Type: 'AWS::S3::BucketPolicy'

  CfDistribution:
    Metadata:
      Comment: 'A simple CloudFront distribution with an S3 origin'
    Properties:
      DistributionConfig:
        Comment: 'A simple distribution with an S3 origin'
        DefaultCacheBehavior:
          AllowedMethods:
            - 'HEAD'
            - 'GET'
          CachedMethods:
            - 'HEAD'
            - 'GET'
          Compress: false
          DefaultTTL: 86400
          ForwardedValues:
            Cookies:
              Forward: 'none'
            Headers:
              - 'Origin'
            QueryString: false
          MaxTTL: 31536000
          MinTTL: 86400
          TargetOriginId: !Sub 's3-origin-S3Bucket'
          ViewerProtocolPolicy: 'redirect-to-https'
        DefaultRootObject: 'index.html'
        Enabled: true
        HttpVersion: 'http1.1'
        IPV6Enabled: false
        Origins:
          - DomainName: !GetAtt S3Bucket.DomainName
            Id: !Sub 's3-origin-S3Bucket'
            OriginPath: ''
            S3OriginConfig:
              OriginAccessIdentity: !Sub 'origin-access-identity/cloudfront/CfOriginAccessIdentity'
        PriceClass: 'PriceClass_All'
    Type: 'AWS::CloudFront::Distribution'

  CfOriginAccessIdentity:
    Metadata:
      Comment: 'Access S3 bucket content only through CloudFront'
    Properties:
      CloudFrontOriginAccessIdentityConfig:
        Comment: 'Access S3 bucket content only through CloudFront'
    Type: 'AWS::CloudFront::CloudFrontOriginAccessIdentity'

Outputs:
  S3BucketName:
    Description: 'Bucket name'
    Value: !Ref S3Bucket
  CfDistributionId:
    Description: 'Id for our cloudfront distribution'
    Value: !Ref CfDistribution
  CfDistributionDomainName:
    Description: 'Domain name for our cloudfront distribution'
    Value: !GetAtt CfDistribution.DomainName
    ''';
  String fileName = 'template.yml';

  CDN(fileName) {
    this.fileName = fileName;
  }
}

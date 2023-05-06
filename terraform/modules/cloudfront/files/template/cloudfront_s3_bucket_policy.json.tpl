{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudfront.amazonaws.com"
            },
            "Action": "s3:GetObject",
            "Resource": "${BUCKET_ARN}/*",
            "Condition": {
                "StringEquals": {
                    "aws:SourceArn": "${DISTRIBUTION_ARN}"
                }
            }
        }
    ]
}

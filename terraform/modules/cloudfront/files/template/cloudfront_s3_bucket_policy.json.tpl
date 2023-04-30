{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "${CLOUDFRONT}"
            },
            "Action": "s3:GetObject",
            "Resource": [
                "arn:aws:s3:::${BUCKET}/*",
                "arn:aws:s3:::${BUCKET}"
            ]
        }
    ]
}

AWS.config(access_key_id: ENV['AWS_ACCESS_KEY_ID'],
			secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
			region: ENV['S3_REGION'])

AWS.config(logger: Logger.new($stdout), log_level: :debug)

S3_BUCKET = AWS::S3.new.buckets[ENV['S3_BUCKET']]
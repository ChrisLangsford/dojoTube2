#AWS.config(YAML.load_file('dojoTube2/config/aws.yml'))

S3_BUCKET = AWS::S3.new.buckets[ENV['S3_BUCKET']]
CarrierWave.configure do |config|
  config.storage = :upyun
  config.upyun_username = "ivyzhang"
  config.upyun_password = "ivyzhang123."
  config.upyun_bucket = "gallery-people"
  config.upyun_bucket_host = "gallery-people.b0.upaiyun.com"
end
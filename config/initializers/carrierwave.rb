CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJIV6X2QSDCQN4HXQ',
    :aws_secret_access_key  => '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',
    :region                 => 'us-west-2',
    :end_point              => 'hsq.s3-website-us-west-2.amazonaws.com'
  }
  config.fog_directory  = 'hsq'
  config.fog_public     = false
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end

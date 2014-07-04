require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_apps, :store => OpenID::Store::Filesystem.new('./tmp'), :name => 'g', :domain => 'shopify.com'
end

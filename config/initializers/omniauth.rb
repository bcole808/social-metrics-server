OmniAuth.config.logger = Rails.logger

CONFIG = YAML.load_file('./config/setup.yml')

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, CONFIG['fb_app_id'], CONFIG['fb_app_secret']
end
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Facebook::APP_ID.to_s, Facebook::SECRET.to_s, :scope => 'email, offline_access, ads_management', 
    :client_options => {:ssl => {:ca_path => "/etc/ssl/certs"}}
end

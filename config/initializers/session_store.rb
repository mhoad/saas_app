# Be sure to restart your server when you modify this file.

options = {
  key: "_saas_app_session"
}
case Rails.env
when "development" 
  options.merge!(domain: "saas_app.dev")
when "test"
  options.merge!(domain: "lvh.me")
when "production"
# TBA
end

SaasApp::Application.config.session_store :cookie_store, options
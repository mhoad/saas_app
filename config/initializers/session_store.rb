# Be sure to restart your server when you modify this file.


options = {
  key: "_saas_app_session"
}
case Rails.env
when "development", "test"
  options.merge!(domain: "lvh.me")
when "production"
  #TBA
end

Rails.application.config.session_store :cookie_store, options
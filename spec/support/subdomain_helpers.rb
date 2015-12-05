module SubdomainHelpers
  def set_subdomain(subdomain)
    site = "#{subdomain}.lvh.me"
    Capybara.app_host = "http://#{site}"
    Capybara.always_include_port = true
    default_url_options[:host] = "#{site}"
  end
end

RSpec.configure do |config|
  config.include SubdomainHelpers, type: :feature
  config.before type: :feature do
    Capybara.app_host = "http://lvh.me"
  end
end
require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "The account index page", :type => :feature do
  after :each do
    Warden.test_reset!
  end

  scenario 'user sees own email address' do
    account = FactoryGirl.create(:account)
    login_as(account, scope: :account)
    visit account_path(account.id)
    expect(page).to have_content account.email
  end
end
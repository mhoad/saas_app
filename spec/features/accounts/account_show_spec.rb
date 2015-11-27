require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "The account show page", :type => :feature do
  after :each do
    Warden.test_reset!
  end

  scenario 'account sees own profile' do
    account = FactoryGirl.create(:account)
    login_as(account, :scope => :account)
    visit account_path(account)
    expect(page).to have_content 'Account'
    expect(page).to have_content account.email
  end

  scenario "account cannot see another account's profile" do
    me = FactoryGirl.create(:account)
    other = FactoryGirl.create(:account, email: 'other@example.com')
    login_as(me, :scope => :account)
    Capybara.current_session.driver.header 'Referer', root_path
    visit account_path(other)
    expect(page).to have_content 'Access denied.'
  end
end
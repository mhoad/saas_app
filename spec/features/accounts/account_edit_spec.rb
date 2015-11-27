require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "Editing an Account", :type => :feature do
  after :each do
    Warden.test_reset!
  end

  scenario 'account changes email address' do
    account = FactoryGirl.create(:account)
    login_as(account, :scope => :account)
    visit edit_account_registration_path(account)
    fill_in 'Email', :with => 'newemail@example.com'
    fill_in 'Current password', :with => account.password
    click_button 'Update'
    txts = [I18n.t( 'devise.registrations.updated'), I18n.t( 'devise.registrations.update_needs_confirmation')]
    expect(page).to have_content(/.*#{txts[0]}.*|.*#{txts[1]}.*/)
  end

  scenario "user cannot cannot edit another user's profile", :me do
    me = FactoryGirl.create(:account)
    other = FactoryGirl.create(:account, email: 'other@example.com')
    login_as(me, :scope => :account)
    visit edit_account_registration_path(other)
    expect(page).to have_content 'Edit Account'
    expect(page).to have_field('Email', with: me.email)
  end

end

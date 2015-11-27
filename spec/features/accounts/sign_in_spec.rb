require 'rails_helper'
describe "The signin process", :type => :feature do
  before :each do
    @account = FactoryGirl.create(:account)
    visit '/accounts/sign_in'
  end

  scenario "signs me in with correct login details" do
    within("#new_account") do
      fill_in 'Email', :with => @account.email
      fill_in 'Password', :with => @account.password
    end
    click_button 'Log in'
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
  end

  scenario "signs me in with incorrect login details" do
    within("#new_account") do
      fill_in 'Email', :with => @account.email
      fill_in 'Password', :with => "incorrect_password"
    end
    click_button 'Log in'
    expect(page).to_not have_content I18n.t 'devise.sessions.invalid'
  end
end
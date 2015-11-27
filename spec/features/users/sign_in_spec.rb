require 'rails_helper'
describe "The signin process", :type => :feature do
  before :each do
    @user = FactoryGirl.create(:user)
    visit '/users/sign_in'
  end

  scenario "signs me in with correct login details" do
    within("#new_user") do
      fill_in 'Email', :with => @user.email
      fill_in 'Password', :with => @user.password
    end
    click_button 'Log in'
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
  end

  scenario "signs me in with incorrect login details" do
    within("#new_user") do
      fill_in 'Email', :with => @user.email
      fill_in 'Password', :with => "incorrect_password"
    end
    click_button 'Log in'
    expect(page).to_not have_content I18n.t 'devise.sessions.invalid'
  end
end
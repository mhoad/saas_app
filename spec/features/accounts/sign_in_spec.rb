require 'rails_helper'
describe "The signin process", :type => :feature do
  before :each do
    @account = FactoryGirl.create(:account)
  end

  it "signs me in with correct login details" do
    visit '/accounts/sign_in'
    within("#new_account") do
      fill_in 'Email', :with => @account.email
      fill_in 'Password', :with => @account.password
    end
    click_button 'Log in'
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
  end
end
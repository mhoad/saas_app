require 'rails_helper'
describe "The signout process", :type => :feature do
  before :each do
    @account = FactoryGirl.create(:account)
  end

  it "signs me in" do
    visit '/accounts/sign_in'
    within("#new_account") do
      fill_in 'Email', :with => @account.email
      fill_in 'Password', :with => @account.password
    end
    click_button 'Log in'
    click_link 'Logout'
    expect(page).to have_content I18n.t 'devise.sessions.signed_out'
  end
end
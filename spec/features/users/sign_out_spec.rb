require 'rails_helper'
describe "The signout process", :type => :feature do
  before :each do
    @user = FactoryGirl.create(:user)
  end

  it "signs me in" do
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'Email', :with => @user.email
      fill_in 'Password', :with => @user.password
    end
    click_button 'Log in'
    click_link 'Logout'
    expect(page).to have_content I18n.t 'devise.sessions.signed_out'
  end
end
require 'rails_helper'

feature 'Adding Websites' do
  let(:account) { FactoryGirl.create(:account) }
  context "as the account's owner" do
    before do
      login_as(account.owner)
      set_subdomain(account.subdomain)
      visit root_url
    end

    it "can add a website" do
      click_link "Add Website"
      fill_in "Url", with: "http://www.example.com/"
      click_button "Create Website"

      expect(page).to have_content("Website has been successfully saved")
    end
  end
end
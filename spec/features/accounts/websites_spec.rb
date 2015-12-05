require "rails_helper"

feature "Websites" do
  let!(:account_a) { FactoryGirl.create(:account) }
  let!(:account_b) { FactoryGirl.create(:account) }
  
  before do
    FactoryGirl.create(:website, url: "http://www.google.com", account: account_a)
    FactoryGirl.create(:website, url: "http://www.amazon.com", account: account_b)
  end
  
  context "index" do
    scenario "displays only account A's website" do
      set_subdomain(account_a.subdomain)
      login_as(account_a.owner)
      visit root_url
      expect(page).to have_content("http://www.google.com")
      expect(page).to_not have_content("http://www.amazon.com")
    end
    
    scenario "displays only account B's website" do
      set_subdomain(account_b.subdomain)
      login_as(account_b.owner)
      visit root_url
      expect(page).to have_content("http://www.amazon.com")
      expect(page).to_not have_content("http://www.google.com")
    end
  end
end
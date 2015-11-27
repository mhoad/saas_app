require 'rails_helper'

RSpec.describe Account, type: :model do
  before(:each) { @account = Account.new(email: 'user@example.com') }

  subject { @account }

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@account.email).to match 'user@example.com'
  end
end
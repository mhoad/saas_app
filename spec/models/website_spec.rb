require 'rails_helper'

RSpec.describe Website, type: :model do
  it "has a valid factory" do
    # Using the shortened version of FactoryGirl syntax.
    expect(build(:website)).to be_valid
  end
  
  let(:website) { FactoryGirl.create(:website) }

  describe "ActiveModel validations" do
    it { expect(website).to validate_presence_of(:url) }
    it { expect(website).to_not allow_value("website").for(:url) }
  end
end

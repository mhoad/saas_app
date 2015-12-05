FactoryGirl.define do  
  factory :membership do
    account nil
    user nil
  end
  
  factory :invitation do
    email "MyString"
    account_id 1
  end
  
  factory :website do
    url "http://www.website.com/"
  end

  factory :account do
    sequence(:name) { |n| "Test Account #{n}" }
    sequence(:subdomain) { |n| "test#{n}" }
    association :owner, :factory => :user
  end
  
  factory :user do
    email 'test@example.com'
    password 'f4k3p455w0rd'
  end
end
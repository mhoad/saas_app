FactoryGirl.define do  
  factory :website do
    url "http://www.website.com/"
  end

  factory :account do
    name "testaccount"
  end
  
  factory :user do
    email 'test@example.com'
    password 'f4k3p455w0rd'
  end
end
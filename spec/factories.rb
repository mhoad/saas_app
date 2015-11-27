FactoryGirl.define do  factory :account do
    name "MyString"
  end
  
  factory :user do
    email 'test@example.com'
    password 'f4k3p455w0rd'
  end

  # factory :account do
  #   email 'test@example.com'
  #   password 'f4k3p455w0rd'
  # end
end
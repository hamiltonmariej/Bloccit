include RandomData

FactoryGirl.define do
  factory :label do
    name RandomData.random_name
    topic
    post
    user
    role :admin
  end
end

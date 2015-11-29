FactoryGirl.define do
   factory :vote do
    value { [1, -1].sample }
    post
    user
    role :member
  end
end

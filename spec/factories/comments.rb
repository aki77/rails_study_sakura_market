FactoryGirl.define do
  factory :comment do
    diary_id 1
    user_id 1
    body "MyText"
  end
end

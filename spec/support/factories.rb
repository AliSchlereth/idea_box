FactoryGirl.define do
  factory :user do
    name
  end

  factory :idea do
    name
    user {create(:user)}
    category {create(:category)}
  end


  sequence :name do |n|
    "Name #{n}"
  end

  factory :category do
    name
  end


end

FactoryGirl.define do
  factory :user do
    name
  end

  factory :idea do
    name
    user {create(:user)}
  end


  sequence :name do |n|
    "Name #{n}"
  end


end

FactoryGirl.define do
  factory :user do
    name
    sequence :email do |n|
      "email #{n}"
    end
    sequence :password do
      "password"
    end

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

  factory :image do
    sequence :url do |n|
      "http://#{n}.com"
    end
  end


end

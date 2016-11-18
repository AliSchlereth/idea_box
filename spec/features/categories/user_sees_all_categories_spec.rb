require "rails_helper"

describe "User sees all categories" do
  scenario "they see all categories" do
    cat1, cat2 = create_list(:category, 2)

    visit categories_path

    expect(page).to have_content cat1.name
    expect(page).to have_content cat2.name
  end

  scenario "they click a category link" do
    cat = create(:category)
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit categories_path
    click_on "#{cat.name}"

    expect(current_path).to eq category_path(cat)
  end
end

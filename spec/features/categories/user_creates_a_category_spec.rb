require "rails_helper"

describe "User creates a new category" do
  scenario "they create a new category" do
    visit new_category_path
    fill_in "category[name]", with: "Cat Name"
    click_on "Create Category"

    expect(page).to have_content "Cat Name"
  end

  scenario "they link from user show page" do
    user = create(:user)
    visit user_path(user)
    click_on "Create a New Category"

    expect(current_path).to eq(new_category_path)
  end

end

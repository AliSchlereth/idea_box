require "rails_helper"

describe "Admin creates a new category" do
  before :each do
    @admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end
  scenario "they create a new category" do

    visit new_admin_category_path
    fill_in "category[name]", with: "Cat Name"
    click_on "Create Category"

    expect(page).to have_content "Cat Name"
  end

  scenario "they link from admin category index page" do
    visit admin_categories_path
    click_on "Create a New Category"

    expect(current_path).to eq(new_admin_category_path)
  end

end

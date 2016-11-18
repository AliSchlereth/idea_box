require "rails_helper"

describe "Admin deletes a category" do
  before :each do
    @admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    @cat = create(:category)

  end
  describe "they delete from show" do
    scenario "they click delete" do

      visit admin_category_path(@cat)
      click_on "Delete"

      expect(page).to_not have_content @cat.name
    end

    scenario "they are redirected to category index" do

      visit admin_category_path(@cat)
      click_on "Delete"

      expect(current_path).to eq admin_categories_path
    end
  end

  describe "they delete from index" do
    scenario "they click delete" do

      visit admin_categories_path
      click_on "Delete"

      expect(page).to_not have_content @cat.name
    end

    scenario "they are redirected to index" do

      visit admin_categories_path
      click_on "Delete"

      expect(current_path).to eq admin_categories_path
    end
  end
end

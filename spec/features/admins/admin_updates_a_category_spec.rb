require 'rails_helper'

describe "Admin updates a category" do
  before :each do
    @admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    @cat = create(:category)
  end
  describe "they link to edit" do
    scenario "they start on show page" do

      visit admin_category_path(@cat)
      click_on "Edit"

      expect(current_path).to eq edit_admin_category_path(@cat)
    end

    scenario "they start on index page" do
      cat1, cat2 = create_list(:category, 2)

      visit admin_categories_path
      within(".category_#{cat1.id}") do
        click_on "Edit"
      end

      expect(current_path).to eq edit_admin_category_path(cat1)
    end
  end

  describe "Admin updates from edit" do
    scenario "they udpate the name" do

      visit edit_admin_category_path(@cat)
      fill_in "category[name]", with: "NewName"
      click_on "Update #{@cat.name}"

      expect(page).to have_content "NewName"
    end
  end

end

require 'rails_helper'

describe "User updates a category" do
  describe "they link to edit" do
    scenario "they start on show page" do
      cat = create(:category)

      visit category_path(cat)
      click_on "Edit"

      expect(current_path).to eq edit_category_path(cat)
    end

    scenario "they start on index page" do
      cat1, cat2 = create_list(:category, 2)

      visit categories_path
      within(".category_#{cat1.id}") do
        click_on "Edit"
      end

      expect(current_path).to eq edit_category_path(cat1)
    end
  end

  describe "they update from edit" do
    scenario "they udpate the name" do
      cat = create(:category)

      visit edit_category_path(cat)
      fill_in "category[name]", with: "NewName"
      click_on "Update #{cat.name}"

      expect(page).to have_content "NewName"
    end
  end


end

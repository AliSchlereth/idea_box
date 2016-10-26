require "rails_helper"

describe "User deletes a category" do
  describe "they delete from show" do
    scenario "they click delete" do
      cat = create(:category)

      visit category_path(cat)
      click_on "Delete"

      expect(page).to_not have_content cat.name
    end

    scenario "they are redirected to category index" do
      cat = create(:category)

      visit category_path(cat)
      click_on "Delete"

      expect(current_path).to eq categories_path
    end
  end

  describe "they delete from index" do
    scenario "they click delete" do
      cat = create(:category)

      visit categories_path
      click_on "Delete"

      expect(page).to_not have_content cat.name
    end

    scenario "they are redirected to index" do
      cat = create(:category)

      visit categories_path
      click_on "Delete"

      expect(current_path).to eq categories_path
    end
  end
end

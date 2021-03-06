require 'rails_helper'

describe "User deletes an idea" do
  before :each do
    @user = create(:user)
    @cat = create(:category)
    @idea = @user.ideas.create(name: "Name3", resources: "http://link.com", category: @cat)
  end
  describe"they delete idea from show page" do
    scenario "they click delete" do

      visit user_idea_path(@user, @idea)
      click_on "Delete"

      expect(page).to_not have_content "Name3"
    end

    scenario "they are redirected to idea index" do

      visit user_idea_path(@user, @idea)
      click_on "Delete"

      expect(current_path).to eq(user_ideas_path(@user))
    end
  end

  describe "they delete an entry from idea index" do
    scenario "they click delete" do

      visit user_ideas_path(@user)
      click_on "Delete"

      expect(page).to_not have_content "Name3"
    end

    scenario "they are redirected to the index" do

      visit user_ideas_path(@user)
      click_on "Delete"

      expect(current_path).to eq(user_ideas_path(@user))
    end
  end

end

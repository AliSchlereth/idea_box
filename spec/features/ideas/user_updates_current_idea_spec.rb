require 'rails_helper'

describe "User edits a current idea" do
  before :each do
    @user = create(:user)
    @cat = create(:category)
    @idea = @user.ideas.create(name: "Name", category: @cat)
  end
  scenario "they visit the edit from the individual show page" do

    visit user_idea_path(@user, @idea)
    click_on "Edit"

    expect(current_path).to eq(edit_user_idea_path(@user, @idea))
  end

  scenario "they update the name" do

    visit edit_user_idea_path(@user, @idea)
    fill_in "idea[name]", with: "Idea Name"
    click_on "Update"

    expect(page).to have_content "Idea Name"
    expect(page).to_not have_content "Name3"
  end

  scenario "they update the description" do

    visit edit_user_idea_path(@user, @idea)
    fill_in "idea[description]", with: "This is a thing"
    click_on "Update"

    expect(page).to have_content "This is a thing"
    expect(page).to_not have_content "DescribeMe"
  end

  scenario "they update the resources list" do

    visit edit_user_idea_path(@user, @idea)
    fill_in "idea[resources]", with: "http://newthing.com"
    click_on "Update"

    expect(page).to_not have_content "http://link.com"
    expect(page).to have_content "http://newthing.com"
  end

  scenario "they are redirected to updated show page upon completion" do

    visit edit_user_idea_path(@user, @idea)
    fill_in "idea[resources]", with: "http://newthing.com"
    click_on "Update"

    expect(current_path).to eq(user_idea_path(@user, @idea))
  end
end

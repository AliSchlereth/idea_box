require 'rails_helper'

describe "User creates a new idea" do
  scenario "they enter a new idea" do
    user = create(:user)
    category = create(:category)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)
    fill_in "idea[name]", with: "New Idea Name"
    fill_in "idea[description]", with: "Describe me!"
    fill_in "idea[resources]", with: "Link the links!"
    select "#{category.name}", from: "idea_category_id"
    click_on "Create New Idea"

    expect(page).to have_content "New Idea Name"
    expect(page).to have_content "Describe me!"
    expect(page).to have_content "Link the links!"
    expect(current_path).to eq("/users/#{user.id}/ideas/#{Idea.last.id}")
  end

end

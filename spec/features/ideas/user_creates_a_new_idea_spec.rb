require 'rails_helper'

describe "User creates a new idea" do
  scenario "they enter a new idea" do
    user = create(:user)

    visit user_path(user)
    fill_in "idea[name]", with: "Idea Name"
    fill_in "idea[description]", with: "Describe me!"
    fill_in "idea[resources]", with: "Link the links!"
    click_on "Create New Idea"

    expect(page).to have_content "Idea Name"
    expect(page).to have_content "Describe me!"
    expect(page).to have_content "Link the links!"
    expect(current_path).to eq("/users/#{user.id}/ideas/#{Idea.last.id}")
  end

end

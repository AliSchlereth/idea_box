require 'rails_helper'

describe "User visits the idea index" do
  scenario "they see all the current ideas" do
    user = create(:user)
    cat = create(:category)
    idea1 = user.ideas.create(name: "Name1", category: cat)
    idea2 = user.ideas.create(name: "Name2", category: cat)

    visit user_ideas_path(user)

    expect(page).to have_content idea1.name
    expect(page).to have_content idea2.name
  end

  scenario "they can click each idea to redirect to idea show" do
    user = create(:user)
    cat = create(:category)
    idea = user.ideas.create(name: "Name", category: cat)

    visit user_ideas_path(user)
    click_on "Name"

    expect(current_path).to eq(user_idea_path(user, idea))
  end
end

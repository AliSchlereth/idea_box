require 'rails_helper'

describe "User sees all users" do
  scenario "they visit the index" do
    user1, user2 = create_list(:user, 2)

    visit users_path

    expect(page).to have_content user1.name
    expect(page).to have_content user2.name
  end
end

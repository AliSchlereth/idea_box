require "rails_helper"

describe "User creates new account" do
  scenario "they enter new user information" do
    visit new_user_path
    fill_in "user[name]", with: "Name"
    click_on "Create New User"

    expect(page).to have_content"Name"
  end
end

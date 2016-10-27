require "rails_helper"

describe "User creates new account" do
  scenario "they enter new user information" do
    visit new_user_path
    fill_in "user[name]", with: "Name"
    fill_in "user[email]", with: "name@email.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_on "Create User"

    expect(page).to have_content "Name"
  end
end

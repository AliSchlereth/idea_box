require 'rails_helper'

describe "User logs in" do
  scenario "they enter information" do
    user = create(:user)

    visit login_path

    fill_in "email", with: "#{user.email}"
    fill_in "password", with: "#{user.password}"
    click_on "Log In"

    expect(page).to have_content "Successfully logged in!"
    expect(page).to have_content "#{user.name}"
  end

  scenario "they enter incorrect information" do
    visit login_path

    fill_in "email", with: "email"
    fill_in "password", with: "password"
    click_on "Log In"

    expect(page).to_not have_content "Successfully logged in!"
    expect(current_path).to eq login_path
  end
end

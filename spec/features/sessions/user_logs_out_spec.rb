require "rails_helper"

describe "User logs out" do
  scenario "they click log out link" do
    user = create(:user)

    visit login_path
    fill_in "email", with: "#{user.email}"
    fill_in "password", with: "#{user.password}"
    click_on "Log In"

    click_on "Log Out"

    expect(page).to have_content "Successfully logged out!"
    expect(current_path).to eq(login_path)
  end
end

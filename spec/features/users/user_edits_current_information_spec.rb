require 'rails_helper'

describe "User edits own entry" do
  scenario "they update their name" do
    user = create(:user)

    visit edit_user_path(user)
    fill_in "user[name]", with: "Edited Name"
    click_on "Update"

    expect(page).to_not have_content user.name
    expect(page).to have_content "Edited Name"
  end

  # scenario "they update their email" do
  #   user = create(:user)
  #
  #   visit edit_user_path(user)
  #   fill_in "user[email]", with: "Edited Email"
  #   click_on "Update"
  #
  #   expect(page).to_not have_content user.email
  #   expect(page).to have_content "Edited Email"
  # end

  # scenario "they update their password" do
  #   user = create(:user)
  #
  #   visit edit_user_path(user)
  #   fill_in "user[email]", with: "Edited Email"
  #   fill_in "user[password]", with: "pass"
  #   fill_in "user[password_confirmation]", with: "pass"
  #   click_on "Update"
  #
  #   expect(page).to_not have_content user.email
  #   expect(page).to have_content "Edited Email"
  # end


end

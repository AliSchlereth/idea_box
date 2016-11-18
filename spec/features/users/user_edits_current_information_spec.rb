require 'rails_helper'

describe "User edits own entry" do
  before :each do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  scenario "they update their name" do
    old_name = @user.name

    visit edit_user_path(@user)
    fill_in "user[name]", with: "Edited Name"
    click_on "Update"

    expect(current_path).to eq(user_path(@user.id))
    expect(page).to_not have_content old_name
    expect(page).to have_content "Edited Name"
  end

  scenario "they update their email" do
    old_email = @user.email

    visit edit_user_path(@user)
    fill_in "user[email]", with: "Edited Email"
    click_on "Update"

    expect(page).to_not have_content old_email
    expect(page).to have_content "Edited Email"
  end

end

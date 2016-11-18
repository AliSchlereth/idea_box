require "rails_helper"

describe "User delete own account" do
  scenario "user clicks delete from user show" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)
    click_on "Delete"

    expect(page).to have_content "Deleted #{user.name} account."
    expect(current_path).to eq(login_path)
  end
end

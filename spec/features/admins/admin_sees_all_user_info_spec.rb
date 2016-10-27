require 'rails_helper'

describe "admin sees all users" do
  scenario "they visit the admin user index" do
    admin = create(:admin)
    user1, user2 = create_list(:user, 2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_users_path

    expect(page).to have_content user1.name
    expect(page).to have_content user2.name
  end
end

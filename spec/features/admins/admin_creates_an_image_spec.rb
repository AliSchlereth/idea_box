require "rails_helper"

describe "Admin creates a new image" do
  scenario "they upload an image path" do
    admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_image_path

    fill_in "image[url]", with: "http://thing.com"
    click_on "Link Image"

    expect(page).to have_content "http://thing.com"
  end
end

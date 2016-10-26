require "rails_helper"

describe "User creates a new image" do
  scenario "they upload an image path" do
    visit new_image_path
    fill_in "image[url]", with: "http://thing.com"
    click_on "Link Image"

    expect(page).to have_content "http://thing.com"
  end
end

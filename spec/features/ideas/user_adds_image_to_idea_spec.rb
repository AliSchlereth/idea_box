require 'rails_helper'

describe "User attaches image to an idea" do
  scenario "user creates an idea with an image" do
    user = create(:user)
    category = create(:category)
    image1, image2 = create_list(:image, 2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)
    fill_in "idea[name]", with: "New Idea Name"
    fill_in "idea[description]", with: "Describe me!"
    fill_in "idea[resources]", with: "Link the links!"
    select "#{category.name}", from: "idea_category_id"
    check "image-#{image1.id}"
    click_on "Create New Idea"

    expect(page).to have_content "New Idea Name"
    expect(page).to have_css "img[src*='#{image1.url}']" 
  end
end

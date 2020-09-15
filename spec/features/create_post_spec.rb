require 'rails_helper'

RSpec.feature "Create a post", type: feature do
  scenario "Can submit a post and view it" do
    visit "/posts"
    click_link "Upload new post"
    fill_in "post[title]", with: "Hello World!"
    click_button "Create Post"
    expect(page).to have_content("Hello World!")
  end
end
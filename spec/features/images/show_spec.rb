require "rails_helper"

RSpec.describe "logo likes" do
  it "displays logo picture likes" do
    visit "/admin/merchants"
    expect(page).to have_content(Number of Likes: Unsplash::Photo.find('MnSVpXUyRww').likes)
  end
end
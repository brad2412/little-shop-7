require "rails_helper"
RSpec.describe "Admin merchant" do
  let!(:merchant1) {Merchant.create!(name: 'Stuff Emporium')}
  let!(:merchant2) {Merchant.create!(name: 'Junk')}
  let!(:merchant2) {Merchant.create!(name: 'Homemade stuff')}
  let!(:merchant2) {Merchant.create!(name: 'Cool Stuff')}
  
  it "displays merchant index page" do
    visit "/admin/merchants"
    expect(page).to have_content("Name: Stuff Emporium")

  end
end
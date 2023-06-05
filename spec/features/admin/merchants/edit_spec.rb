require "rails_helper"

RSpec.describe "Admin Merchant" do

  let!(:merchant1) {Merchant.create!(name: 'Stuff Emporium')}
  let!(:merchant2) {Merchant.create!(name: 'Junk')}
  let!(:merchant3) {Merchant.create!(name: 'Homemade stuff')}
  let!(:merchant4) {Merchant.create!(name: 'Cool Stuff')}
  
  it "can update merchant" do
    visit "/admin/merchants/#{merchant1.id}"
    expect(page).to have_content("Stuff Emporium")
    click_link "Update Merchant"
    expect(current_path).to eq("/admin/merchants/#{merchant1.id}/edit")
    fill_in("Name", with: "Savings Emporium")
    click_button "Submit"
    expect(current_path).to eq("/admin/merchants/#{merchant1.id}")
    expect(page).to have_content("Savings Emporium")
  end
end
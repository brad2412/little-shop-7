require "rails_helper"

RSpec.describe "Admin Merchant" do

  let!(:merchant1) {Merchant.create!(name: 'Stuff Emporium')}
  let!(:merchant2) {Merchant.create!(name: 'Junk')}
  let!(:merchant3) {Merchant.create!(name: 'Homemade stuff')}
  let!(:merchant4) {Merchant.create!(name: 'Cool Stuff')}
  
  it "displays merchant index page" do
    visit "/admin/merchants"
    expect(page).to have_content("Name: Stuff Emporium")
    expect(page).to have_content("Junk")
    expect(page).to have_content("Homemade stuff")
    expect(page).to have_content("Cool Stuff")
  end

  describe "admin merchant show page" do
    it "displays admin merchant show page" do
      visit "admin/merchants"
      click_link "Stuff Emporium"
      expect(current_path).to eq("/admin/merchants/#{merchant1.id}")
      expect(page).to have_content("Stuff Emporium")
      expect(page).to_not have_content("Junk")
    end
    
    it "can update merchant" do
      visit "/admin/merchants/#{merchant1.id}"
      expect(page).to have_content("Stuff Emporium")
      click_link "Update Merchant"
      expect(current_path).to eq("/admin/merchants/#{merchant1.id}/edit")
      fill_in("Name", with: "Savings Emporium")
      click_link "Submit"
      expect(current_path).to eq("/admin/merchants/#{merchant1.id}")

    end

  end
end

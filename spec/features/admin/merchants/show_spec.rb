require "rails_helper"

RSpec.describe "Admin Merchant" do

  let!(:merchant1) {Merchant.create!(name: 'Stuff Emporium')}
  let!(:merchant2) {Merchant.create!(name: 'Junk')}
  let!(:merchant3) {Merchant.create!(name: 'Homemade stuff')}
  let!(:merchant4) {Merchant.create!(name: 'Cool Stuff')}
  describe "admin merchant show page" do
    it "displays admin merchant show page" do
      visit "admin/merchants"
      click_link "Stuff Emporium"
      expect(current_path).to eq("/admin/merchants/#{merchant1.id}")
      expect(page).to have_content("Stuff Emporium")
      expect(page).to_not have_content("Junk")
    end
  end

end
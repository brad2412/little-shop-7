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
  it "changes merchant status" do
    visit "/admin/merchants"
    click_button "Disable #{merchant1.name}"
    expect(current_path).to eq("/admin/merchants/#{merchant1.id}")
    expect(merchant1.status).to eq("Disabled")
  end
  # As an admin,
  # When I visit the admin merchants index (/admin/merchants)
  # Then next to each merchant name I see a button to disable or enable that merchant.
  # When I click this button
  # Then I am redirected back to the admin merchants index
  # And I see that the merchant's status has changed

end

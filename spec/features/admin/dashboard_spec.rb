require "rails_helper"

RSpec.describe "Admin Dashboard" do
  describe "When I visit the admin dashboard (/admin)" do
    it "displays the admin dashboard" do
      visit "/admin"
      expect(page).to have_content("Admin Dashboard")
    end
    it "can display links" do
      visit "/admin"
      expect(page).to have_link("admin merchants")
      expect(page).to have_link("admin invoices")

      click_link "admin merchants"
      expect(current_path).to eq("/admin/merchants")
      
      visit "/admin"
      click_link "admin invoices"
      expect(current_path).to eq("/admin/invoices")
      
    end
  end
end

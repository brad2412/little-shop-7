require 'rails_helper'

RSpec.describe 'Merchant Dashboard' do
  before(:each) do 
    @merchant_1 = create(:merchant)
  end
  
  describe "US1 '/merchants/:merchant_id/dashboard'" do 
    it 'merchant dashboard shows the name of the merchant' do
      visit "/merchants/#{@merchant_1.id}/dashboard" 
      expect(page).to have_content("Welcome back, #{@merchant_1.name}")
    end
  end

  describe "US2 /merchants/:merchant_id/dashboard"
    it 'merchant dashboard items links' do 
      visit "/merchants/#{@merchant_1.id}/dashboard" 
      expect(page).to have_link('My Items')
      click_link('My Items')
      expect(current_path).to eq("/merchants/#{@merchant_1.id}/items")
    end
    
    it 'merchant dashboard invoices link' do 
      visit "/merchants/#{@merchant_1.id}/dashboard" 
      expect(page).to have_link('My Invoices')
      click_link('My Invoices')
      expect(current_path).to eq("/merchants/#{@merchant_1.id}/invoices")
    end
end

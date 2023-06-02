require 'rails_helper'

RSpec.describe 'Merchant Dashboard' do
  before(:each) do 
    @merchant_1 = create(:merchant)
  end

  #User Story 1
  describe '/merchants/:merchant_id/dashboard' do 
    it 'merchant dashboard shows the name of the merchant' do
      visit "/merchants/#{@merchant_1.id}/dashboard" 
      expect(page).to have_content("Welcome back, #{@merchant_1.name}")
    end
  end
end
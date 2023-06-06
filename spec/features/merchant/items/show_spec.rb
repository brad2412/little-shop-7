
require 'rails_helper' 

RSpec.describe 'Merchant Items Show Page', type: :feature do 
  before(:each) do 
    @betty = create(:merchant)
    @joshy = create(:merchant)
    @item_1 = create(:item,unit_price: 2222, merchant_id: @betty.id)
    @item_2 = create(:item, merchant_id: @betty.id)
    @item_3 = create(:item, merchant_id: @betty.id)
    @item_4 = create(:item, unit_price: 7890, merchant_id: @joshy.id)
  end
  
  describe '/merchants/:merchant_id/items/:item_id' do 
    it 'shows items attributes on view page' do
      visit  merchant_item_path(@betty, @item_1)
      within("h1") do
        expect(page).to have_content("#{@betty.name}'s #{@item_1.name} Show Page") 
      end
      expect(page).to have_content(@item_1.name) 
      expect(page).to have_content("Description: #{@item_1.description}") 
      expect(page).to have_content("Current Selling Price: $22.22") 
      expect(page).to_not have_content(@item_2.name) 
      expect(page).to_not have_content(@item_3.name) 
      expect(page).to_not have_content(@item_4.name) 
    end
    
    it 'if item unit price ends in zero, unit price is still formatted' do 
      visit  merchant_item_path(@joshy, @item_4)
      expect(page).to have_content("Current Selling Price: $78.90")
    end
  end

  describe 'US8 Merchant Item Update' do 
    it 'has a link to update' do 
      visit merchant_item_path(@joshy, @item_4)
      expect(page).to have_link('Update Item', href: edit_merchant_item_path(@joshy, @item_4))
    end

    it 'clicking on link takes merchant to page' do 
      visit merchant_item_path(@joshy, @item_4)
      expect(page).to have_link('Update Item', href: edit_merchant_item_path(@joshy, @item_4))
      click_link('Update Item')
      expect(current_path).to eq(edit_merchant_item_path(@joshy, @item_4))

      fill_in(:name, with: "Bag of Raisins")
      click_button "Update Item"
      expect(current_path).to eq(merchant_item_path(@joshy, @item_4))
      expect(page).to have_content('Bag of Raisins')
save_and_open_page
      expect(page).to have_content("#{@item_4.name} successfully updated")
    end
  end
end
# Merchant Item Update
# As a merchant,
# When I visit the merchant show page of an item (/merchants/:merchant_id/items/:item_id)
# I see a link to update the item information.
# When I click the link
# Then I am taken to a page to edit this item
# And I see a form filled in with the existing item attribute information
# When I update the information in the form and I click ‘submit’
# Then I am redirected back to the item show page where I see the updated information
# And I see a flash message stating that the information has been successfully updated.


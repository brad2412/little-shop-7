require 'rails_helper' 

RSpec.describe 'merchants/:merchant_id/items', type: :feature do 
  before(:each) do 
    @betty = create(:merchant)
    @joshy = create(:merchant)
    @item_1 = create(:item, merchant_id: @betty.id)
    @item_2 = create(:item, merchant_id: @betty.id)
    @item_3 = create(:item, merchant_id: @betty.id)
    @item_4 = create(:item, merchant_id: @joshy.id)
  end

  describe 'US 6 page displays items' do 
    it 'page shows list of names of items' do 
      visit "merchants/#{@betty.id}/items"
      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_2.name)
      expect(page).to have_content(@item_3.name)
    end

    it 'page does not show item names for other merchants' do 
      visit "merchants/#{@betty.id}/items"
      expect(page).to_not have_content(@item_4.name)
    end
  end

  describe 'US7 items have links to show pages' do 
    it 'has link to item show pages' do
      visit merchant_items_path(@betty) 
      expect(page).to have_link("#{@item_3.name}", href: merchant_item_path(@betty, @item_3))
    end
  end
end
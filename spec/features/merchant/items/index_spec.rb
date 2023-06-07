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
      expect(page).to have_link("#{@item_3.name}")
    end
  end

  describe "US9 Merchant Item Disable/Enable" do
    it "Next to each item name I see a button to disable or enable that item. When I click this button  Then I am redirected back to the items index And I see that the items status has changed" do
      @item_2.update(status: 0)
      visit merchant_items_path(@betty) 

      within("#enabled-items-#{@item_1.id}") do
        expect(page).to have_content("Status: #{@item_1.status}")
        expect(page).to have_button("Disable")
        click_button("Disable")
        expect(current_path).to eq(merchant_items_path(@betty))
        expect(page).to have_content("Status: Disabled")
        expect(page).to have_button("Enable")
      end
      within("#disabled-items-#{@item_2.id}") do
        expect(page).to have_content("Status: #{@item_2.status}")
        expect(page).to have_button("Enable")
        click_button("Enable")
        save_and_open_page
        expect(current_path).to eq(merchant_items_path(@betty))
      end
    end
  end
end




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

  it "can update item" do
    visit edit_merchant_item_path(@joshy, @item_4)
    expect(page).to have_content("#{@item_4.name}")

    fill_in(:name, with: "Bag of Raisins")
    click_button "Update Item"
    expect(current_path).to eq(merchant_item_path(@joshy, @item_4))
    expect(page).to have_content('Bag of Raisins')
  end
end
# And I see a form filled in with the existing item attribute information
# When I update the information in the form and I click ‘submit’
# Then I am redirected back to the item show page where I see the updated information
# And I see a flash message stating that the information has been successfully updated.
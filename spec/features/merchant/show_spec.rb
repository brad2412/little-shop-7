require 'rails_helper'

RSpec.describe 'Merchant Dashboard' do
  before(:each) do 
    @merchant_1 = create(:merchant, name: 'Merchant 1')
    @item_1 = Item.create!(name: 'Glue', description: 'Glues stuff together', unit_price: 2, merchant_id: @merchant_1.id)
    @item_2 = Item.create!(name: 'Crayons', description: 'Great to color with', unit_price: 8, merchant_id: @merchant_1.id)
    @item_3 = Item.create!(name: 'Pencils', description: 'Great to write with', unit_price: 5, merchant_id: @merchant_1.id)
    @item_4 = Item.create!(name: 'Erasers', description: 'Erases mistakes', unit_price: 3, merchant_id: @merchant_1.id)

    @c1 = Customer.create!(first_name: 'Bilbo', last_name: 'Baggins')
    @c2 = Customer.create!(first_name: 'Frodo', last_name: 'Baggins')
    @c3 = Customer.create!(first_name: 'Samwise', last_name: 'Gamgee')
    @c4 = Customer.create!(first_name: 'Aragorn', last_name: 'Elessar')
    @c5 = Customer.create!(first_name: 'Arwen', last_name: 'Undomiel')
    @c6 = Customer.create!(first_name: 'Legolas', last_name: 'Greenleaf')
    @c7 = Customer.create!(first_name: 'Gandalf', last_name: 'The Great')


    @inv1 = Invoice.create!(customer_id: @c1.id, status: 2)
    @inv2 = Invoice.create!(customer_id: @c1.id, status: 2)
    @inv3 = Invoice.create!(customer_id: @c2.id, status: 2)
    @inv4 = Invoice.create!(customer_id: @c3.id, status: 2)
    @inv5 = Invoice.create!(customer_id: @c4.id, status: 2)
    @inv6 = Invoice.create!(customer_id: @c5.id, status: 2)
    @inv7 = Invoice.create!(customer_id: @c6.id, status: 2)
    @inv8 = Invoice.create!(customer_id: @c7.id, status: 2)

    @ii_1 = InvoiceItem.create!(invoice_id: @inv1.id, item_id: @item_1.id, quantity: 1, unit_price: 10, status: 0)
    @ii_2 = InvoiceItem.create!(invoice_id: @inv2.id, item_id: @item_2.id, quantity: 1, unit_price: 8, status: 0)
    @ii_3 = InvoiceItem.create!(invoice_id: @inv3.id, item_id: @item_3.id, quantity: 1, unit_price: 5, status: 2)
    @ii_4 = InvoiceItem.create!(invoice_id: @inv4.id, item_id: @item_3.id, quantity: 1, unit_price: 5, status: 1)
    @ii_5 = InvoiceItem.create!(invoice_id: @inv5.id, item_id: @item_3.id, quantity: 1, unit_price: 5, status: 1)
    @ii_6 = InvoiceItem.create!(invoice_id: @inv6.id, item_id: @item_3.id, quantity: 1, unit_price: 5, status: 1)
    @ii_7 = InvoiceItem.create!(invoice_id: @inv7.id, item_id: @item_4.id, quantity: 1, unit_price: 5, status: 1)
    @ii_8 = InvoiceItem.create!(invoice_id: @inv8.id, item_id: @item_4.id, quantity: 1, unit_price: 5, status: 1)

    @tran1 = Transaction.create!(invoice_id: @inv1.id, result: 0)
    @tran2 = Transaction.create!(invoice_id: @inv1.id, result: 0)
    @tran3 = Transaction.create!(invoice_id: @inv1.id, result: 0)
    @tran4 = Transaction.create!(invoice_id: @inv2.id, result: 0)
    @tran5 = Transaction.create!(invoice_id: @inv2.id, result: 0)
    @tran6 = Transaction.create!(invoice_id: @inv3.id, result: 0)
    @tran7 = Transaction.create!(invoice_id: @inv3.id, result: 0)
    @tran8 = Transaction.create!(invoice_id: @inv4.id, result: 0)
    @tran9 = Transaction.create!(invoice_id: @inv5.id, result: 0)
    @tran10 = Transaction.create!(invoice_id: @inv5.id, result: 0)
    @tran11 = Transaction.create!(invoice_id: @inv5.id, result: 0)
    @tran12 = Transaction.create!(invoice_id: @inv5.id, result: 0)
    @tran13 = Transaction.create!(invoice_id: @inv6.id, result: 0)
    @tran14 = Transaction.create!(invoice_id: @inv6.id, result: 0)
    @tran15 = Transaction.create!(invoice_id: @inv6.id, result: 0)
    @tran16 = Transaction.create!(invoice_id: @inv7.id, result: 1)
    @tran17 = Transaction.create!(invoice_id: @inv8.id, result: 0)

  end
  
  describe "US1 '/merchants/:merchant_id/dashboard'" do 
    it 'when I visit the merchant dashboard shows the name of the merchant' do
      visit "/merchants/#{@merchant_1.id}/dashboard" 

      expect(page).to have_content("Welcome Back, #{@merchant_1.name}")
    end
  end

  describe "US2 '/merchants/:merchant_id/dashboard'" do
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

    describe "US3 Lists Top 5 Customers" do
      it "I see the names of the top 5 customers who have conducted the largest number of successful transactions with my merchant " do
        visit "/merchants/#{@merchant_1.id}/dashboard"

        within(".top_five_customers")do
          expect(page).to have_content("Top Five Customers")
          expect(page).to have_content("#{@c1.first_name} #{@c1.last_name} has #{@c1.transaction_counter} Succesful Transactions")
          expect(page).to have_content("#{@c2.first_name} #{@c2.last_name} has #{@c2.transaction_counter} Succesful Transactions")
          expect(page).to have_content("#{@c3.first_name} #{@c3.last_name} has #{@c3.transaction_counter} Succesful Transactions")
          expect(page).to have_content("#{@c4.first_name} #{@c4.last_name} has #{@c4.transaction_counter} Succesful Transactions")
          expect(page).to have_content("#{@c5.first_name} #{@c5.last_name} has #{@c5.transaction_counter} Succesful Transactions")
          expect(page).to_not have_content("#{@c6.first_name} #{@c6.last_name} has #{@c6.transaction_counter} Succesful Transactions")

          expect(@c1.first_name).to appear_before(@c2.first_name)
          expect(@c4.first_name).to appear_before(@c2.first_name)
          expect(@c2.first_name).to appear_before(@c3.first_name)
          expect(@c5.first_name).to appear_before(@c2.first_name)
          expect(@c2.first_name).to_not appear_before(@c1.first_name)
        end
      end
    end

    describe "US4 Items Ready to Ship" do
      it " I see a section for 'Items Ready to Ship' In that section I see a list of the names of all of my items that have been ordered and have not yet been shipped" do
        visit "/merchants/#{@merchant_1.id}/dashboard"

        expect(page).to have_content("Items Ready To Ship")
        expect(page).to have_content(@item_3.name)
        expect(page).to have_content(@item_4.name)      
      end

      it "next to each item I see the id of the invoice that ordered my item and each invoice id is a link to my merchant's invoice show page" do
        visit "/merchants/#{@merchant_1.id}/dashboard"
        expect(page).to have_content("---- Invoice ID Links ")
        expect(page).to have_content(@item_3.name)
        expect(page).to have_link(@inv3.id)
        click_link(@inv3.id)
        expect(current_path).to eq("/merchants/#{@merchant_1.id}/invoices/#{@inv3.id}")

        visit "/merchants/#{@merchant_1.id}/dashboard"
        expect(page).to have_content(@item_3.name)
        expect(page).to have_link(@inv4.id)
        click_link(@inv4.id)
        expect(current_path).to eq("/merchants/#{@merchant_1.id}/invoices/#{@inv4.id}")
        expect(current_path).to eq("/merchants/#{@merchant_1.id}/invoices/#{@inv4.id}")

        visit "/merchants/#{@merchant_1.id}/dashboard"
        expect(page).to have_content(@item_3.name)
        expect(page).to have_link(@inv5.id)
        click_link(@inv5.id)
        expect(current_path).to eq("/merchants/#{@merchant_1.id}/invoices/#{@inv5.id}")
        expect(current_path).to eq("/merchants/#{@merchant_1.id}/invoices/#{@inv5.id}")

        visit "/merchants/#{@merchant_1.id}/dashboard"
        expect(page).to have_content(@item_3.name)
        expect(page).to have_link(@inv6.id)
        click_link(@inv6.id)
        expect(current_path).to eq("/merchants/#{@merchant_1.id}/invoices/#{@inv6.id}")
        expect(current_path).to eq("/merchants/#{@merchant_1.id}/invoices/#{@inv6.id}")
      end
    end
  end
end

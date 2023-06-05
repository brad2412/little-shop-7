require 'rails_helper'

RSpec.describe Merchant, type: :model do
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
  describe 'relationships' do 
    it { should have_many(:items) }
    it { should have_many(:invoice_items).through(:items) }
    it { should have_many(:invoices).through(:invoice_items)}
    it { should have_many(:customers).through(:invoices) }
    it { should have_many(:transactions).through(:invoices) }
  end

  describe 'existence' do 
    it 'can be instantiated' do 
      merchant = Merchant.create!(name: 'Helena Nabaoth')
    end
  end

  describe "top five customers who have conducted the largest number of successful transactions with my merchant" do
    it "::top_five_customers" do
      expect(@merchant_1.top_five_customers).to eq([@c1, @c4, @c5, @c2, @c3])
    end
  end

  describe " Lists list of the names of all of my items that have been ordered and have not yet been shipped" do
    it "::items_ready_to_ship" do
      expect(@merchant_1.items_ready_to_ship).to eq([ @item_3, @item_4])
    end
  end
end
require "rails_helper"

RSpec.describe Item, type: :model do
  before(:each) do 
    @item = create(:item)
    @invoice1 = create(:invoice)
    @invoice2 = create(:invoice)
    @invoice3 = create(:invoice)

    InvoiceItem.create!(invoice_id: @invoice1.id, item_id: @item.id)
    InvoiceItem.create!(invoice_id: @invoice2.id, item_id: @item.id)
    InvoiceItem.create!(invoice_id: @invoice3.id, item_id: @item.id)
  end

  describe "relationships" do
    it {should belong_to(:merchant)}
    it {should have_many(:invoice_items)}
    it {should have_many(:invoices).through(:invoice_items)}
  end

  describe 'instance methods' do 
    it '#date_format' do 
      freeze_time do 
        allow(Time).to receive(:current).and_return Time.new(2000)
        item = create(:item, created_at: Time.current) 
        expect(item.format_date).to eq("Saturday, January 1, 2000")
      end
    end

    it '#order_invoices' do 
      expect(@item.order_invoices).to eq([@invoice1, @invoice2, @invoice3])
    end
  end
end

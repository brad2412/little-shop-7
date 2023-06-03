require 'rails_helper'

RSpec.describe Merchant, type: :model do
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
end
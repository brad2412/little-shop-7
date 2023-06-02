require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'relationships' do 
    it {should have_many(:items)}
  end

  describe 'existence' do 
    it 'can be instantiated' do 
      merchant = Merchant.create!(name: 'Helena Nabaoth')
    end
  end
end
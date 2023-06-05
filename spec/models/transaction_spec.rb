require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'relationships' do 
    it {should belong_to(:invoice)}
    it {should have_many(:customers).through(:invoice)}
    it { should define_enum_for(:result).with_values(success: 0, failed: 1)}
    end
  end
require "rails_helper"

RSpec.describe Invoice, type: :model do
  describe "relationships" do
    it {should belong_to(:customer)}
    it {should have_many(:transactions)}
    it {should have_many(:invoice_items)}
    it {should have_many(:items).through(:invoice_items)}
    
    it { should define_enum_for(:status).with_values("in progress": 0, completed: 1, cancelled: 2)}
  end
end

# 21. Admin Dashboard Statistics - Top Customers

# As an admin,
# When I visit the admin dashboard (/admin)
# Then I see the names of the top 5 customers
# who have conducted the largest number of successful transactions
# And next to each customer name I see the number of successful transactions they have
# conducted
require "rails_helper"

RSpec.describe Customer, type: :model do
  describe "relationships" do
    it {should have_many :invoices}
  end

  describe "class methods" do
    let!(:person1) {Customer.create!( first_name: "Danger", last_name: "Powers")}
    let!(:person2) {Customer.create!( first_name: "Forest", last_name: "Gump")}
    let!(:person3) {Customer.create!( first_name: "Sterling", last_name: "Archer")}
    let!(:person4) {Customer.create!( first_name: "Napoleon", last_name: "Dynamite")}
    let!(:person5) {Customer.create!( first_name: "Tom", last_name: "Hanks")}
    let!(:person6) {Customer.create!( first_name: "Ace", last_name: "Ventura")}
    
    let!(:invoice1) {Invoice.create!( customer_id: person1.id, status: 1)}
    let!(:invoice2) {Invoice.create!( customer_id: person1.id, status: 1)}
    let!(:invoice3) {Invoice.create!( customer_id: person1.id, status: 1)}
    let!(:invoice4) {Invoice.create!( customer_id: person1.id, status: 1)}
    let!(:invoice5) {Invoice.create!( customer_id: person1.id, status: 1)}
    let!(:invoice6) {Invoice.create!( customer_id: person2.id, status: 1)}
    let!(:invoice7) {Invoice.create!( customer_id: person2.id, status: 1)}
    let!(:invoice8) {Invoice.create!( customer_id: person2.id, status: 1)}
    let!(:invoice9) {Invoice.create!( customer_id: person2.id, status: 1)}
    let!(:invoice10) {Invoice.create!( customer_id: person3.id, status: 1)}
    let!(:invoice11) {Invoice.create!( customer_id: person3.id, status: 1)}
    let!(:invoice12) {Invoice.create!( customer_id: person3.id, status: 1)}
    let!(:invoice13) {Invoice.create!( customer_id: person4.id, status: 1)}
    let!(:invoice14) {Invoice.create!( customer_id: person4.id, status: 1)}
    let!(:invoice15) {Invoice.create!( customer_id: person5.id, status: 1)}
    let!(:invoice16) {Invoice.create!( customer_id: person6.id, status: 0)}

    let!(:transaction1) {Transaction.create!( invoice_id: invoice1.id, result: 0)}
    let!(:transaction2) {Transaction.create!( invoice_id: invoice2.id, result: 0)}
    let!(:transaction3) {Transaction.create!( invoice_id: invoice3.id, result: 0)}
    let!(:transaction4) {Transaction.create!( invoice_id: invoice4.id, result: 0)}
    let!(:transaction5) {Transaction.create!( invoice_id: invoice5.id, result: 0)}
    let!(:transaction6) {Transaction.create!( invoice_id: invoice6.id, result: 0)}
    let!(:transaction7) {Transaction.create!( invoice_id: invoice7.id, result: 0)}
    let!(:transaction8) {Transaction.create!( invoice_id: invoice8.id, result: 0)}
    let!(:transaction9) {Transaction.create!( invoice_id: invoice9.id, result: 0)}
    let!(:transaction10) {Transaction.create!( invoice_id: invoice10.id, result: 0)}
    let!(:transaction11) {Transaction.create!( invoice_id: invoice11.id, result: 0)}
    let!(:transaction12) {Transaction.create!( invoice_id: invoice12.id, result: 0)}
    let!(:transaction13) {Transaction.create!( invoice_id: invoice13.id, result: 0)}
    let!(:transaction14) {Transaction.create!( invoice_id: invoice14.id, result: 0)}
    let!(:transaction15) {Transaction.create!( invoice_id: invoice15.id, result: 0)}
    let!(:transaction16) {Transaction.create!( invoice_id: invoice16.id, result: 1)}


    it "#top_5_customers" do
      expect(Customer.top_5_customers).to eq([person1, person2, person3, person4, person5])
    end
  end
end

require "rails_helper"

RSpec.describe "Admin invoices show" do
  let!(:person1) {Customer.create!( first_name: "Danger", last_name: "Powers")}
  let!(:person2) {Customer.create!( first_name: "Forest", last_name: "Gump")}
  let!(:person3) {Customer.create!( first_name: "Sterling", last_name: "Archer")}
  let!(:person4) {Customer.create!( first_name: "Napoleon", last_name: "Dynamite")}
  let!(:person5) {Customer.create!( first_name: "Tom", last_name: "Hanks")}
  let!(:person6) {Customer.create!( first_name: "Ace", last_name: "Ventura")}

  let!(:merchant1) {Merchant.create!(name: 'Stuff Emporium', status: 0)}
  let!(:merchant2) {Merchant.create!(name: 'Junk', status: 1)}
  let!(:merchant3) {Merchant.create!(name: 'Homemade stuff', status: 0)}
  let!(:merchant4) {Merchant.create!(name: 'Cool Stuff', status: 1)}
  let!(:merchant5) {Merchant.create!(name: 'Good Stuff', status: 1)}
  let!(:merchant6) {Merchant.create!(name: 'Bad Stuff', status: 1)}
  let!(:merchant7) {Merchant.create!(name: 'junk Stuff', status: 1)}

  let!(:item1) {Item.create!(name: "Toy", description: "Toy", unit_price: 100, merchant_id: merchant2.id )}
  let!(:item2) {Item.create!(name: "Food", description:  "Food", unit_price: 600, merchant_id: merchant1.id)}
  let!(:item3) {Item.create!(name: "Shoes", description: "Shoes", unit_price: 12000, merchant_id: merchant5.id)}
  let!(:item4) {Item.create!(name: "boat", description: "boat", unit_price: 5000000, merchant_id: merchant4.id)}
  let!(:item5) {Item.create!(name: "cards", description: "cards", unit_price: 500, merchant_id: merchant1.id)}
  let!(:item6) {Item.create!(name: "sponge", description: "sponge", unit_price: 200, merchant_id: merchant1.id)}
  let!(:item6) {Item.create!(name: "rubber duck", description: "rubber duck", unit_price: 150, merchant_id: merchant1.id)}
  let!(:item6) {Item.create!(name: "rubber dino", description: "rubber dino", unit_price: 150, merchant_id: merchant2.id)}
  let!(:item6) {Item.create!(name: "rubber bands", description: "rubber bands", unit_price: 180, merchant_id: merchant7.id)}
  
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
  let!(:invoice17) {Invoice.create!( customer_id: person6.id, status: 1)}

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
  let!(:transaction17) {Transaction.create!( invoice_id: invoice15.id, result: 0)}

  let!(:invoice_item1) {InvoiceItem.create!( item_id: item1.id, invoice_id: invoice1.id, quantity: 2, unit_price: 200, status: 0)}
  let!(:invoice_item2) {InvoiceItem.create!( item_id: item2.id, invoice_id: invoice1.id, quantity: 4, unit_price: 200, status: 1)}
  let!(:invoice_item3) {InvoiceItem.create!( item_id: item3.id, invoice_id: invoice2.id, quantity: 5, unit_price: 200, status: 0)}
  let!(:invoice_item4) {InvoiceItem.create!( item_id: item4.id, invoice_id: invoice2.id, quantity: 1, unit_price: 200, status: 1)}
  let!(:invoice_item5) {InvoiceItem.create!( item_id: item5.id, invoice_id: invoice3.id, quantity: 6, unit_price: 200, status: 0)}
  let!(:invoice_item7) {InvoiceItem.create!( item_id: item6.id, invoice_id: invoice4.id, quantity: 8, unit_price: 200, status: 2)}
  
  it "displays admin invoice show page" do
    visit "admin/invoices/#{invoice1.id}"
    expect(page).to have_content("ID: #{invoice1.id}")
    expect(page).to have_content("Status: #{invoice1.status}")
    expect(page).to have_content(invoice1.created_at.strftime("%A, %B %d, %Y"))
    expect(page).to have_content("Customer: Danger Powers")
  end

  it "displays item name, quantity of the item ordered, price of item sold, & Invoice Item status" do
    visit "admin/invoices/#{invoice1.id}"
    expect(page).to have_content("Item Name: Toy")
    expect(page).to have_content("Quantity: 2")
    expect(page).to have_content("Price: 100")
    expect(page).to have_content("Status: pending")
  end

  it "displays total revenue" do
    visit "admin/invoices/#{invoice1.id}"

    expect(page).to have_content("Total Revenue: 1200")
  end
end

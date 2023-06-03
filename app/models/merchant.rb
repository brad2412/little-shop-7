class Merchant < ApplicationRecord
  has_many :items
  has_many :invoice_items, through: :items
  has_many :invoices, through: :invoice_items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices

  def top_five_customers
    customers.joins(:transactions)
    .group(:id)
    .where( transactions: {result: 0})
    .order("COUNT(transactions.id) DESC")
    .limit(5)  
  end
end
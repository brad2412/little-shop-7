class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices

  def transaction_counter
    transactions.where(transactions: {result: 0}).count
  end
  def self.top_5_customers
    # Customer.select(:customers).joins(invoices: :transactions).where(transactions: { result: 0 }).group(:id).select(:customers).order("COUNT(transactions.id) DESC").limit(5)
    Customer.select("customers.*").joins(invoices: :transactions).where(transactions: { result: 0 }).group(:id).order("COUNT(transactions.id) DESC").limit(5)
  end
end
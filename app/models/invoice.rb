class Invoice < ApplicationRecord
  belongs_to :customer
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions
  
  enum status: { "in progress": 0, completed: 1, cancelled: 2}

  # def self.top_5_customers
  #   # joins(:customer).where(status: "completed").group(:first_name, :last_name, :status).distinct.order(count: :desc).limit(5).count
    
  # end
end
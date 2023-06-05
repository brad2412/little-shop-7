class Invoice < ApplicationRecord
  belongs_to :customer
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions
  
  enum status: { "in progress": 0, completed: 1, cancelled: 2}

  def self.incomplete_orders
    joins(:invoice_items).select(:id, :created_at).where(invoice_items: {status: [1, 0]}).order(created_at: :asc).uniq
  end

  def format_date
    created_at.strftime("%A, %B %-d, %Y")
  end

  def self.order_by_created_at
    order(:created_at)
  end

  def self.retrieve_invoice(id)
    find_by_id(id)
  end
end
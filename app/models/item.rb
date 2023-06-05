class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def format_date
    created_at.strftime("%A, %B %-d, %Y")
  end

  def order_invoices 
    invoices.order(:created_at)
  end
end
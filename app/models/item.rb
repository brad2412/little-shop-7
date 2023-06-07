class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  enum status: { "Disabled": 0, Enabled: 1 }


  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true

  def format_date
    created_at.strftime("%A, %B %-d, %Y")
  end

  def order_invoices 
    invoices.order(:created_at)
  end
  
  def format_unit_price
    explode = unit_price.to_s
    if explode.last != '0'
      "$#{sprintf("%g", unit_price.to_f/100)}" 
    else
      "$#{sprintf("%g", unit_price.to_f/100) << '0'}"
    end
  end
end
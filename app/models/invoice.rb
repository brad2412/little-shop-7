class Invoice < ApplicationRecord
  belongs_to :customer
  has_many :invoice_items
  has_many :items, through: :invoice_items
  # enum :status ["pending", "packaged", "shipped"]
  enum status: { "in progress": 0, completed: 1, cancelled: 2}

  Invoice.joins(:customer).where(status: "completed").group(:customer_id, :status).count.uniq
  Invoice.joins(:customer).where(status: "completed").group(:customer_id, :status).order(status: :desc).distinct.count

end
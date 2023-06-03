class Transaction < ApplicationRecord
  belongs_to :invoice
  has_many :customers, through: :invoice
  enum status: {success: 0, failed: 1}
end


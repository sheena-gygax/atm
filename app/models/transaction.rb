class Transaction < ApplicationRecord
  belongs_to :account
  
  TRANSACTION_TYPES = %w(deposit withdraw)

  before_validation :default_transaction_number

  validates :account, presence: true
  validates :amount, presence: true, numericality: true
  validates :transaction_number, presence: true, uniqueness: true
  validates :transaction_type, presence: true, inclusion: { in: TRANSACTION_TYPES }

  def default_transaction_number
    self.transaction_number = SecureRandom.hex(12) if self.new_record?
  end
end

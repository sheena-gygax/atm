class Account < ApplicationRecord
  belongs_to :customer
  has_many :transactions

  before_validation :default_balance
  before_validation :default_account_number

  validates :customer, presence: true
  validates :account_number, presence: true, uniqueness: true
  validates :balance, presence: true, numericality: true

  def default_balance                 
    self.balance = 0.00 if self.new_record?
  end

  def default_account_number
    self.account_number = rand.to_s[2..10]if self.new_record?
  end
end

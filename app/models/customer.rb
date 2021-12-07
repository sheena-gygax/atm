class Customer < ApplicationRecord
  has_many :accounts, dependent: :destroy
  
  validates :pin_number, presence: true, uniqueness: true, length: { is: 4 }
end

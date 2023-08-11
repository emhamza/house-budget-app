class Item < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :balance_items, dependent: :destroy
  has_many :balances, through: :balance_items, dependent: :destroy, source: 'balance'

  validates :name, :amount, presence: true
end

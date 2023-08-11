class Balance < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :balance_items, dependent: :destroy
  has_many :items, through: :balance_items, dependent: :destroy, source: 'item'

  validates :name, :icon, presence: true
end

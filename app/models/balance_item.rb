class BalanceItem < ApplicationRecord
  belongs_to :item
  belongs_to :balance
end

class User < ApplicationRecord
  has_many :items, dependent: :destroy, foreign_key: :author_id
  has_many :balances, dependent: :destroy, foreign_key: :author_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
end

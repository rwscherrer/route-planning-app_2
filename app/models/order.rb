class Order < ApplicationRecord
  belongs_to :user
  has_many :jobs
  has_many :carted_products
  has_many :accents, through: :carted_products
end

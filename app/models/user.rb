class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: {with: /\w{2,}[@]\w+[.]\w{2,3}/,
    message: "must be valid email" }

  has_many :orders
  has_many :carted_products
  has_many :products, through: :carted_products

  def currently_carted
    carted_products.where(status: "carted")
  end

end

class AddDistanceToCartedProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :carted_products, :distance, :float
  end
end

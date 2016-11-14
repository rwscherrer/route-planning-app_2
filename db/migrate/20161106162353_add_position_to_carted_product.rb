class AddPositionToCartedProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :carted_products, :position, :integer
  end
end

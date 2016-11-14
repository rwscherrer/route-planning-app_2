class AddRowOrderToCartedProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :carted_products, :row_order, :integer
  end
end

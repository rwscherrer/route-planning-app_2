class AddInProgressToCartedProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :carted_products, :in_progress, :boolean
  end
end

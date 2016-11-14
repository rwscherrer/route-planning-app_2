class AddPriorityToCartedProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :carted_products, :priority, :integer
  end
end

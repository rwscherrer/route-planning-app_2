class AddColumnsToCartedProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :carted_products, :user_id, :integer
    add_column :carted_products, :job_id, :integer
    add_column :carted_products, :status, :string
    add_column :carted_products, :order_id, :integer
  end
end

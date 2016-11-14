class AddJobDurationToCartedProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :carted_products, :job_duration, :float
  end
end

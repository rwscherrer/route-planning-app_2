class AddJobDuratioToCartedProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :job_duration, :float
  end
end

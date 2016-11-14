class AddJobIdToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :job_id, :integer
  end
end

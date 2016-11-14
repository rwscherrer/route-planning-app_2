class AddColumnsToJobsCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs_categories, :job_id, :integer
    add_column :jobs_categories, :category_id, :integer
  end
end

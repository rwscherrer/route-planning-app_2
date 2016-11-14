class CreateJobsCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs_categories do |t|


      t.timestamps
    end
  end
end

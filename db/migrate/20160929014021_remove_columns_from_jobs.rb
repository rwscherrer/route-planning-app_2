class RemoveColumnsFromJobs < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :latitude, :decimal
    remove_column :jobs, :longitude, :decimal
    remove_column :jobs, :last_service_date, :datetime
  end
end

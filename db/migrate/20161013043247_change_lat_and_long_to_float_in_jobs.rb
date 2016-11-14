class ChangeLatAndLongToFloatInJobs < ActiveRecord::Migration[5.0]
  def change
    change_column :jobs, :latitude, :float 
    change_column :jobs, :longitude, :float
  end
end

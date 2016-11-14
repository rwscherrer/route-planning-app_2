class AddLatAndLongToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :latitude, :decimal, {:precision => 10, :scale => 6}
    add_column :jobs, :longitude, :decimal, {:precision => 10, :scale => 6}
  end
end

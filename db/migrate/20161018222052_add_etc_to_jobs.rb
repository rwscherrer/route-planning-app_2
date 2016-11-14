class AddEtcToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :duration, :float
  end
end

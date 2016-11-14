class RemoveJobDurationFromJobs < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :job_duration, :float
  end
end

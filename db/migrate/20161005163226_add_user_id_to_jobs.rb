class AddUserIdToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :user_jd, :integer, default: 1
  end
end

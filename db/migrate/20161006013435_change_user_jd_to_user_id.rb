class ChangeUserJdToUserId < ActiveRecord::Migration[5.0]
  def change
    rename_column :jobs, :user_jd, :user_id
  end
end

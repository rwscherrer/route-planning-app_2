class AddColumnsToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :name, :string
    add_column :jobs, :address, :string
    add_column :jobs, :phone_number, :string
    add_column :jobs, :email, :string
    add_column :jobs, :last_service_date, :datetime
  end
end

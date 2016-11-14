class AddAddressColumnsToJobs < ActiveRecord::Migration[5.0]
  def change
    rename_column :jobs, :address, :address_1
    add_column :jobs, :address_2, :string
    add_column :jobs, :city, :string
    add_column :jobs, :state, :string
    add_column :jobs, :zip, :string
  end
end

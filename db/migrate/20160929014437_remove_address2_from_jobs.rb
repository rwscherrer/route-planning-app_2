class RemoveAddress2FromJobs < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :address_2, :string
  end
end

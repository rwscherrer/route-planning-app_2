class AddLastServiceDateToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :last_service_date, :datetime
  end
end

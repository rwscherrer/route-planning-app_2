class ChangeLastServiceFromDateTimeToDate < ActiveRecord::Migration[5.0]
  def change
    change_column :jobs, :last_service_date, :date
  end
end

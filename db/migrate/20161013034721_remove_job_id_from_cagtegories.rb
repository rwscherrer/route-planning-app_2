class RemoveJobIdFromCagtegories < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :job_id, :integer
    
  end
end

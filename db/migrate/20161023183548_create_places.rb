class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :title
      t.string :address
      t.string :text
      t.float :latitude
      t.float :longitude
      t.string :visited_by
      t.integer :job_id

      t.timestamps
    end
  end
end

class AddColumnsToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :category, :string
    add_column :categories, :importance, :integer
  end
end

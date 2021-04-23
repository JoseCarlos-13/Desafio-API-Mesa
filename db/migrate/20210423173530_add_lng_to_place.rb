class AddLngToPlace < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :lng, :float
  end
end

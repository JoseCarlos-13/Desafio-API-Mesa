class RemoveLongFromPlace < ActiveRecord::Migration[6.0]
  def change
    remove_column :places, :long, :float
  end
end

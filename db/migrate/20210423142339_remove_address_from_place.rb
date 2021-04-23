class RemoveAddressFromPlace < ActiveRecord::Migration[6.0]
  def change
    remove_column :places, :address, :string
  end
end

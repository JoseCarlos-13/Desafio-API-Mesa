class AddAddressToPlace < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :address, :string
  end
end

class AddColumnToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :shipping_burden, :integer, null: false
  end
end

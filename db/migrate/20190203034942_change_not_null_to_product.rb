class ChangeNotNullToProduct < ActiveRecord::Migration[5.0]
  def up
    change_column_null :products, :buyer_id, true
  end

  def down
    change_column_null :products, :buyer_id, false
  end
end

class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :birthday_year, :integer
    add_column :users, :birthday_month, :integer
    add_column :users, :birthday_day, :integer

    remove_column :users, :birthday, :date
  end
end

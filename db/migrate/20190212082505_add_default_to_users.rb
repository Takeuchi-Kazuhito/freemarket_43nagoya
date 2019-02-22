class AddDefaultToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :family_name,     ""
    change_column_default :users, :first_name,     ""
    change_column_default :users, :family_katakana,     ""
    change_column_default :users, :first_katakana,     ""
    change_column_default :users, :domicile_pref,     ""
    change_column_default :users, :domicile_city,     ""
    change_column_default :users, :domicile_add,     ""
    change_column_default :users, :phone_number,     ""
  end
end

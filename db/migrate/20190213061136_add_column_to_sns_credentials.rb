class AddColumnToSnsCredentials < ActiveRecord::Migration[5.0]
  def change
    add_column :sns_credentials, :name, :string
    add_column :sns_credentials, :email, :string
  end
end

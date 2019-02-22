class RenameNameColumnToSnsCredentials < ActiveRecord::Migration[5.0]
  def change
    rename_column :sns_credentials, :name, :nickname
  end
end

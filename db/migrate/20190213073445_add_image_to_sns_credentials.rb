class AddImageToSnsCredentials < ActiveRecord::Migration[5.0]
  def change
    add_column :sns_credentials, :image, :string
  end
end

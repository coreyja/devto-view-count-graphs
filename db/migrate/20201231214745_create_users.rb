class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    enable_extension "pgcrypto"
    create_table :users, id: :uuid do |t|
      t.string :dev_to_username, null: false, index: true, unique: true
      t.string :name, null: false

      t.string :profile_image_url, null: true
      t.string :profile_image_90_url, null: true

      t.timestamps
    end
  end
end

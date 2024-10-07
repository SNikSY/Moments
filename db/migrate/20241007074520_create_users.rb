class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :full_name
      t.text :bio
      t.string :profile_picture
      t.datetime :last_login

      t.timestamps  # Добавляет created_at и updated_at
    end
  end
end

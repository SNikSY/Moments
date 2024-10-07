class CreateNotifications < ActiveRecord::Migration[7.2]
  def change
    create_table :notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :sender_id
      t.integer :moment_id
      t.string :notification_type
      t.string :message
      t.boolean :is_read

      t.timestamps
    end
  end
end

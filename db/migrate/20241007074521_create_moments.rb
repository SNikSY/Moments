class CreateMoments < ActiveRecord::Migration[7.2]
  def change
    create_table :moments do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.datetime :expires_at

      t.timestamps
    end
  end
end

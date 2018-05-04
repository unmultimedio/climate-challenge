class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :slack_id
      t.string :username

      t.timestamps
    end
    add_index :users, :slack_id, unique: true
  end
end

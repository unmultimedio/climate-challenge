class CreateQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    create_table :questionnaires do |t|
      t.references :user, foreign_key: true
      t.integer :value

      t.timestamps
    end
  end
end

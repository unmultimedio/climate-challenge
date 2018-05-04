class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :user, foreign_key: true
      t.references :questionnaire, foreign_key: true
      t.references :category, foreign_key: true
      t.references :option, foreign_key: true
      t.references :question, foreign_key: true
      t.integer :value

      t.timestamps
    end
  end
end

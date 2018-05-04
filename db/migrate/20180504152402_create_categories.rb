class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :max_value
      t.integer :min_value
      t.integer :good_below
      t.integer :average_below

      t.timestamps
    end
  end
end

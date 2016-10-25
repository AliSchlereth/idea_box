class CreateIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      t.string :name
      t.string :description
      t.string :resources
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end

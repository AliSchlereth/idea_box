class CreateIdeasImages < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas_images do |t|
      t.references :idea, foreign_key: true
      t.references :image, foreign_key: true

      t.timestamps null: false
    end
  end
end

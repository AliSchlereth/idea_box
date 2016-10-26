class AddCategoryRefToIdeas < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :idea_id
    add_reference :ideas, :category, foreign_key: true
  end
end

class RenameCategoriesIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :categories_id, :category_id
  end
end

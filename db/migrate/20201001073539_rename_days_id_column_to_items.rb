class RenameDaysIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :days_id, :day_id
  end
end

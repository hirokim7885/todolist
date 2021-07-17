class RenameNameColumnToPriorities < ActiveRecord::Migration[6.1]
  def change
    rename_column :priorities, :priority, :name
  end
end

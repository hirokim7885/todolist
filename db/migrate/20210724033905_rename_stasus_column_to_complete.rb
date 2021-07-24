class RenameStasusColumnToComplete < ActiveRecord::Migration[6.1]
  def change
    rename_column :tasks, :complete, :status
  end
end

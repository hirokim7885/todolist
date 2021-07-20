class ChangeDataCompleteToTasks < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :complete, :integer
  end
end

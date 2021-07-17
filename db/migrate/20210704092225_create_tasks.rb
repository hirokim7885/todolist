class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|

      t.belongs_to :account
      t.belongs_to :priority

      t.string :title
      t.text :body
      t.datetime :deadline

      t.timestamps
    end
  end
end
class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :task
      t.boolean :status
      t.datetime :createdAt
      t.datetime :completedAt

      t.timestamps
    end
  end
end

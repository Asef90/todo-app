class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :text, null: false
      t.boolean :is_completed, null: false, default: false

      t.timestamps
    end
  end
end

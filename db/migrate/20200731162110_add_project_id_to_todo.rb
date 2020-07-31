class AddProjectIdToTodo < ActiveRecord::Migration[6.0]
  def change
    add_reference :todos, :project, null: false, foreign_key: true
  end
end

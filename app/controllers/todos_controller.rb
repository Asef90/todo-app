class TodosController < ApplicationController
  def create
    @project = Project.find_or_create_by(title: project_params[:title])
    @todo = @project.todos.build(todo_params)

    if @todo.save
      render json: @todo
    else
      render json: { errors: @todo.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.update(is_completed: todo_params[:is_completed])
      render json: @todo
    else
      render json: { errors: @todo.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:text, :is_completed)
  end

  def project_params
    params.require(:project).permit(:title)
  end
end

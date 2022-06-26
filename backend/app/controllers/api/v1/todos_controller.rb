class Api::V1::TodosController < ApplicationController
  def index
    render json: { status: 200, todos: Todo.all }
  end

  def create
    todo = Todo.new(todos_params)

    if todo.save
      # YAGNI!
      render json: { status: :created, todo: todo }
    else
      render json: { status: :unprocessable_entity, errors: todo.errors }
    end
  end

  def destroy
    todo = Todo.find(params[:id])

    if todo.destroy
      render json: { status: 200, todo: todo }
    else
      render json: { status: :unprocessable_entity, errors: todo.errors }
    end
  end

  private

  def todos_params
    params.require(:todos).permit(:title)
  end
end

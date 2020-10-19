class TasksController < ApplicationController
  # before_action :set_task, only: [:edit, :show, :update, :destroy]
  def index
    @tasks = current_user.tasks
  end

  def show
    @task = current_user.tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path,notice: "タスク「#{@task.name}」を登録しました"
    else
      render :new
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    task = current_user.tasks.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_path
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy
    redirect_to tasks_path
  end

private

  def task_params
    params.require(:task).permit(:name, :description).merge(user_id: current_user.id)
  end

  # def set_task
  #   @task = Task.find(params[:id])
  # end

end

class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = current_user.tasks
    @tasks = Task.all.page(params[:page]).per(10)
  end

  def show
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
  end

  def update
    @task.update!(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

private

  def task_params
    params.require(:task).permit(:name, :description).merge(user_id: current_user.id)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

end

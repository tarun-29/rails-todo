class TasksController < ApplicationController
  before_action :confirm_login
  before_action :load_task, :confirm_owner, except: [:index, :new, :create]

  def index
    @tasks = current_user.tasks.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render 'new'
      # render new_task_path(@task)
      # flash[:task_errors] = @task.errors.full_messages
      # render new_task_path(@task)
      # render 'new', local: {task: @task}
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def complete
    @task.update_attribute(:completed, !@task.completed)
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def load_task
    @task = Task.find(params[:id])
  end

  def confirm_login
    unless current_user
      redirect_to root_path, alert: "You must login to manage a todo"
    end
  end

  def confirm_owner
    if @task && current_user != @task.user
      redirect_to tasks, alert: "You do not have permission to that task"
    end
  end


end

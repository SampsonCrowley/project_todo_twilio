class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :destroy, :update]
  before_action :format_date, only: [:create, :update]

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def edit
  end

  def index
    @tasks = Task.all
    @tasks = @tasks.sort_by {|task| [(task.completion_date ? 0 : 1), (task.completion_date || 0)]}
  end

  def new
    @task = Task.new
  end

  def create
    if @task = Task.create(whitelisted)
      redirect_to @task
    else
      render :new
    end
  end

  def show
  end

  private
    def whitelisted
      params.require(:task).permit(:completion_date, :description)
    end

    def find_task
      @task = Task.find_by_id(params[:id])
    end

    def format_date
      params[:task][:completion_date] = Date.strptime(params[:task][:completion_date], "%m/%d/%Y")
    end
end

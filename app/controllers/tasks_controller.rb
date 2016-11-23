class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :destroy, :update]
  before_action :format_date, only: [:create, :update]

  def destroy
    @task.destroy
    flash[:info] = "Task deleted!"
    redirect_to tasks_path
  end

  def edit
  end

  def update 
    if @task.update(whitelisted)
      flash[:success] = 'Task updated!'
      redirect_to @task
    else
      flash.now[:danger] = "Description field is required."
      render :edit
    end
  end

  def index
    @tasks = Task.all
    @tasks = @tasks.sort_by {|task| [(task.completion_date ? 0 : 1), (task.completion_date || 0)]}
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(whitelisted)
    if @task.save
      flash[:success] = 'Task created!'
      redirect_to @task
    else
      flash.now[:danger] = "Please enter a description"
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
      return if params[:task][:completion_date] == ''
      begin
        completion_date = Date.strptime(params[:task][:completion_date], "%m/%d/%Y")
        params[:task][:completion_date] = completion_date
      rescue
        params[:task][:completion_date] = Date.parse(params[:task][:completion_date])
      end
    end
end

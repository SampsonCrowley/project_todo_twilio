class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @tasks = @tasks.sort_by {|task| [(task.completion_date ? 0 : 1), (task.completion_date || 0)]}
  end
end

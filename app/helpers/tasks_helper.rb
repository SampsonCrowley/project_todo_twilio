module TasksHelper
  def is_completed(task)
    if task.completed
      "Completed: #{task.completed.strftime("%m/%d/%Y")}"
    else
      task.completion_date ? "Due Date: #{task.completion_date.strftime("%m/%d/%Y")}" : nil
    end
  end

  def toggle_complete(task)
    if task.completed
      link_to 'Mark Incomplete', task_path(task.id, task: { completed: nil }), method: 'patch'
    else
      link_to 'Mark Complete', task_path(task.id, task: { completed: Date.today }), method: 'patch'
    end
  end
end

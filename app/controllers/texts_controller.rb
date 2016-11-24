class TextsController < ApplicationController
  def send_text
    if task = Task.find_by_id(params[:id])
      Text.send_msg(task.description)
      flash[:success] = "Message Sent"
    else
      flash[:danger] = "An Error Occurred, don't try again."
    end
    redirect_to tasks_path
  end
end

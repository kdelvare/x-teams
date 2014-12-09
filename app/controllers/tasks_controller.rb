class TasksController < ApplicationController
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to teams_url, notice: "Task assigned!"
    else
      render "teams/:index"
    end
  end

  private
  def task_params
    params.require(:task).permit(:team_id, :description)
  end
end

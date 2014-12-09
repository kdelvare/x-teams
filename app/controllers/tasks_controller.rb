class TasksController < ApplicationController
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to teams_url, notice: "Task assigned!"
    else
      render "teams/:index"
    end
  end

  def destroy
    Task.destroy(params[:id])
    redirect_to teams_url, notice: "Task deleted"
  end

  private
  def task_params
    params.require(:task).permit(:team_id, :description)
  end
end

class ClearanceTasksController < ApplicationController
  def new
  end

  def create
    clearance_file = permitted_params[:clearance_file]
    if clearance_file
      clearance_task = ClearanceTask.new(ClearanceFileParser, clearance_file)
      clearance_task.perform
      @items = clearance_task.items
       render :report
    else
      flash[:error] = "Please upload a file"
      render :new
    end
  end

  private
  def permitted_params
    params.permit(:clearance_file)
  end
end

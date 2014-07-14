class ClearanceTaskController < ApplicationController
  def new
  end

  def create
    @clearance_task = ClearanceTask.new(ClearanceFileParser, permitted_params[:clearance_file])
    render nothing: true, status: :created
  end

  private
  def permitted_params
    params.permit(:clearance_file)
  end
end

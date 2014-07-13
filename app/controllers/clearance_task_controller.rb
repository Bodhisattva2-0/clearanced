class ClearanceTaskController < ApplicationController
  def new
  end

  def create
    @clearance_task = ClearanceTask.new(ClearanceFileParser, clearance_file)
    render nothing: true, status: :created
  end

  private
  def clearance_file
    params.permit(:clearance_file)
  end
end

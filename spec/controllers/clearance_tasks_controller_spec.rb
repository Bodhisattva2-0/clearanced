require 'rails_helper'

describe ClearanceTasksController do
  describe "new" do
    it "should render a new form for clearance task" do
      get :new
      expect(response).to be_ok
    end
  end

  describe "create" do
    it "should create a new clearance task" do
      post :create, :clearance_file => fixture_file_upload('clearance_file.csv', 'text/csv')
      expect(response).to be_ok
    end
  end
end

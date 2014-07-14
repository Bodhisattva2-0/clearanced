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
      post :create, :clearance_file => File.open(File.expand_path("spec/fixtures/clearance_file.csv"))
      expect(response.status).to be 201
    end
  end
end

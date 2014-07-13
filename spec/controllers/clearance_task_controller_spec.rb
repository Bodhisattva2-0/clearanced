require 'rails_helper'

RSpec.describe ClearanceTaskController, :type => :controller do
  describe "new" do
    it "should render a new form for clearance task" do
      get :new
      expect(response).to be_ok
    end
  end

  describe "create" do
    it "should create a new clearance task" do
      post :create, :clearance_file => open(File.expand_path("spec/fixtures/clearance_file.txt"), 'r')
      expect(response.status).to be 201
    end
  end
end

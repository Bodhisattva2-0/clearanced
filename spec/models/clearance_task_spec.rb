require 'rails_helper'

describe ClearanceTask do
  describe "run" do
    it "sets up a clearance task for all items in the file" do
      parser = class_double("ClearanceFileParser")
      parser_instance = instance_double("ClearanceFileParser")
      item = instance_double("Item")

      expect(parser).to receive(:new) {parser_instance}
      expect(parser_instance).to receive(:items) { [item] }
      expect(item).to receive(:clearance!)

      clearance_task = ClearanceTask.new(parser, open(File.expand_path("spec/fixtures/clearance_file.csv")))
      clearance_task.perform
    end
  end
end

require 'rails_helper'

describe ClearanceFileParser do
  describe "items" do
    it "returns a list of items for clearance" do
      item_ids = [234, 235, 236]
      item_ids.each {|id| FactoryGirl.create(:item, :id => id)}
      parser = ClearanceFileParser.new(open(File.expand_path("spec/fixtures/clearance_file.csv"), 'r'))
      expect(parser.items).to match_array Item.all
    end
  end
end

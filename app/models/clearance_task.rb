class ClearanceTask
  def initialize(parser, clearance_file)
    @items = parser.new(clearance_file).items
  end

  def perform
    @items.each do |item|
      item.clearance!
    end
  end
end

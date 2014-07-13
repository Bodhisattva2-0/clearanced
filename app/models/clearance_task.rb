class ClearanceTask
  def initialize(parser, clearance_file)
    @items = parser.new(clearance_file).parse
  end

  def perform

  end
end

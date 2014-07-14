require 'csv'
class ClearanceFileParser
  def initialize(file)
    @item_ids = parse(file)
  end

  def items
    Item.where(id: @item_ids)
  end

  private
  def parse(file)
    item_ids = []
    CSV.parse(file.read).each do |row|
      item_ids << row[0] if row[0].present?
    end
    item_ids
  end
end

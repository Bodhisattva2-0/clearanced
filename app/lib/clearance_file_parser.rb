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
    begin
      CSV.parse(file).each do |row|
        item_ids << row[0] if row[0].present?
      end
      item_ids
    rescue Exception => e
      Rails.logger.error(e)
    end
  end
end

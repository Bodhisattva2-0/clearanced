module Clearance
  extend ActiveSupport::Concern

  included  do
    CLEARANCE_PRICE_DROP = 0.75
    delegate :wholesale_price, :type, to: :style
  end

  def clearance!
    return false unless clearable
    sell_as_clearanced!
    mark_as_clearanced!
  end

  private

  def clearance_price
    clearance_price =
    case type
    when "Dress", "Pants"
      flat_clearance_price < 5 ? 5 : flat_clearance_price
    else
      flat_clearance_price < 2 ? 2 : flat_clearance_price
    end
    clearance_price > wholesale_price ? wholesale_price : clearance_price
  end

  def flat_clearance_price
    0.75 * wholesale_price
  end

  def sell_as_clearanced!
    update_attributes(price_sold: clearance_price, sold_at: DateTime.now)
  end

  def mark_as_clearanced!
    update_attributes(:status => :clearanced)
  end

  def clearable
    status != :sold
  end
end

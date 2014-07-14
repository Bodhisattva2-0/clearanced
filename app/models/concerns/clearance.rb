module Clearance
  extend ActiveSupport::Concern

  included  do
    CLEARANCE_PRICE_DROP = 75
  end

  def clearance!

  end
end

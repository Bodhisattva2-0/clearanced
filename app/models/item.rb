class Item < ActiveRecord::Base
  belongs_to :style

  def clearance!

  end
end

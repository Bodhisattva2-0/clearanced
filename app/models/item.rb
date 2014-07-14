class Item < ActiveRecord::Base
  include Clearance
  belongs_to :style

end

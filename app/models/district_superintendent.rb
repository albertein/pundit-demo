class DistrictSuperintendent < ActiveRecord::Base
  belongs_to :user
  belongs_to :district
end

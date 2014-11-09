class DistrictSuperintendent < ActiveRecord::Base
  belongs_to :user
  belong_to :district
end

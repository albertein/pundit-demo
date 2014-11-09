class School < ActiveRecord::Base
  belongs_to :district
  has_many :teachers
  has_many :school_class
end

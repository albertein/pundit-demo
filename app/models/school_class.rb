class SchoolClass < ActiveRecord::Base
  has_many :class_enrollment
  has_many :students, through: :class_enrollment
  belongs_to :teacher
  belongs_to :school
end

class Student < ActiveRecord::Base
  belongs_to :user
  belongs_to :parent
  has_many :class_enrollment
  has_many :school_class, through: :class_enrollment
end

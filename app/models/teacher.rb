class Teacher < ActiveRecord::Base
  belongs_to :school
  belongs_to :user
  has_many :school_class
end

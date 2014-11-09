class District < ActiveRecord::Base
  has_many :schools

  def teachers
    Teacher.joins(:school).where({school: schools})
  end
end

class Teacher < ActiveRecord::Base
  belongs_to :school
  belongs_to :user
  has_many :school_class

  def alumni()
    Student.joins(:school_class).where({school_classes: {teacher_id: id}})
  end

  def teaches?(student)
    alumni().where(id: student.id).count() > 0
  end
end

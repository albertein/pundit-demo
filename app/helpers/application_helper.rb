module ApplicationHelper
  include Pundit
  def app_sections
    sections = [
      {name: 'Students', path: students_path, type: Student},
      {name: 'Teachers', path: teachers_path, type: Teacher},
    ]
    sections.select { |section| policy(section[:type]).index? }
  end
end

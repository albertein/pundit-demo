json.array!(@class_enrollments) do |class_enrollment|
  json.extract! class_enrollment, :id, :school_class_id, :student_id, :grade
  json.url class_enrollment_url(class_enrollment, format: :json)
end

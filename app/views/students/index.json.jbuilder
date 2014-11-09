json.array!(@students) do |student|
  json.extract! student, :id, :name, :user_id, :parent_id
  json.url student_url(student, format: :json)
end

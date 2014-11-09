json.array!(@parents) do |parent|
  json.extract! parent, :id, :name, :user_id
  json.url parent_url(parent, format: :json)
end

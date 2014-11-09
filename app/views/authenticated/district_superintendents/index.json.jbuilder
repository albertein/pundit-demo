json.array!(@district_superintendents) do |district_superintendent|
  json.extract! district_superintendent, :id, :name, :district_id, :user_id
  json.url district_superintendent_url(district_superintendent, format: :json)
end

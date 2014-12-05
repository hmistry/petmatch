json.array!(@shelters) do |shelter|
  json.extract! shelter, :id
  json.url shelter_url(shelter, format: :json)
end

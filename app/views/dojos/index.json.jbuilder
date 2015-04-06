json.array!(@dojos) do |dojo|
  json.extract! dojo, :id, :name
  json.url dojo_url(dojo, format: :json)
end

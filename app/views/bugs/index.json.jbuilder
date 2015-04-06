json.array!(@bugs) do |bug|
  json.extract! bug, :id, :user, :description
  json.url bug_url(bug, format: :json)
end

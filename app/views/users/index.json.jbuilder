json.array!(@users) do |user|
  json.extract! user, :id, :mailid, :password
  json.url user_url(user, format: :json)
end

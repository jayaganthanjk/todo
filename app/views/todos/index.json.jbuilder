json.array!(@todos) do |todo|
  json.extract! todo, :id, :task, :status, :createdAt, :completedAt
  json.url todo_url(todo, format: :json)
end

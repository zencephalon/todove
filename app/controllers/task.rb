get '/task/:id' do |id|
  @task = Task.find(id)
  @task.description
end
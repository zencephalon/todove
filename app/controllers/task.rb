get '/task/:id' do |id|
  @task = Task.find(id)
  @task.description
end

get '/tasks/new' do
  erb :'task/new'
end

post '/tasks' do
  puts params.inspect
  task = Task.create(params[:task])
  redirect ("/task/#{task.id}")
end

get '/task/:id/edit' do |id|
  @task = Task.find(id)
  erb :'task/edit'
end

put '/task/:id' do |id|
  task = Task.find(id)
  task.update(params[:task])
  redirect ("/task/#{task.id}")
end
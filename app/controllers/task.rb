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
get '/' do
  redirect '/tasks/all'
end

get '/task/:id' do |id|
  @task = Task.find(id)
  erb :'task/single', locals: {task: @task}
end

get '/tasks/all' do 
  redirect '/login' unless current_user

  @tasks = current_user.tasks
  erb :'task/all'
end

get '/tasks/new' do
  erb :'task/new'
end

post '/tasks' do
  params[:task][:user_id] = current_user.id
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

put '/task/:id/complete' do |id|
  task = Task.find(id)
  task.complete!
  redirect ("/task/#{task.id}")
end

delete '/task/:id' do |id|
  task = Task.find(id)
  task.destroy
  redirect "/tasks/all"
end
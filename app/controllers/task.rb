get '/' do
  redirect '/tasks/all'
end

get '/task/:id', auth: :user do |id|
  @task = Task.find(id)
  erb :'task/single', locals: {task: @task}
end

get '/tasks/all', auth: :user do 
  @tasks = current_user.tasks.sort_by {|t| t.priority}
  erb :'task/all'
end

get '/tasks/new', auth: :user do
  erb :'task/new'
end

post '/tasks', auth: :user do
  params[:task][:user_id] = current_user.id
  task = Task.create(params[:task])
  redirect ("/")
end

get '/task/:id/edit', auth: :user do |id|
  @task = Task.find(id)
  erb :'task/edit'
end

put '/task/:id', auth: :user do |id|
  task = Task.find(id)
  task.update(params[:task])
  redirect ("/task/#{task.id}")
end

put '/task/:id/toggle_complete', auth: :user do |id|
  task = Task.find(id)
  task.toggle_complete!
  redirect ("/")
end

delete '/task/:id', auth: :user do |id|
  task = Task.find(id)
  task.destroy
  redirect "/tasks/all"
end
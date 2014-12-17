get '/' do
  redirect '/tasks/all'
end

get '/task/:id', auth: :user do |id|
  @task = Task.find(id)
  erb :'task/single', locals: {task: @task}
end

get '/tasks/all', auth: :user do 
  @tasks = current_user.top_level_tasks.sort_by {|t| t.priority}
  erb :'task/all'
end

get '/tasks/new', auth: :user do
  erb :'task/new', locals: {parent_task_id: nil}
end

post '/tasks', auth: :user do
  params[:task][:user_id] = current_user.id
  task = Task.new(params[:task])
  
  unless task.save
    set_ar_errors(task) 
    redirect ("/")
  end

  task.set_tags_from_str(params[:tags])
  
  redirect "/"
end

get '/task/:id/edit', auth: :user do |id|
  @task = Task.find(id)
  erb :'task/edit', locals: {task: @task}
end

put '/task/:id', auth: :user do |id|
  task = Task.find(id)
  task.update(params[:task])

  task.set_tags_from_str(params[:tags])

  if request.xhr?
    erb :'task/single', locals: {task: task}, layout: false
  else
    redirect ("/")
  end
end

put '/task/:id/toggle_complete', auth: :user do |id|
  task = Task.find(id)
  task.toggle_complete!

  if request.xhr?
    erb :'task/single', locals: {task: task}, layout: false
  else
    redirect ("/")
  end
end

delete '/task/:id', auth: :user do |id|
  task = Task.find(id)
  task.destroy
  if request.xhr?
    204
  else
    redirect "/tasks/all"
  end
end
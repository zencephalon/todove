get '/set_cookie' do
  session[:religion] = "lovism"
  "Hello, your cookie has been set"
end

get '/get_cookie' do
  session[:religion]
end

get '/ajax_demo' do
  erb :ajax_demo
end

post '/ajax_demo' do
  p params
  #sleep 3
  #{}"Hello, #{params[:name]} from AJAX demo."
  #erb :welcome
  200
end
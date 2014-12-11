get '/set_cookie' do
  session[:religion] = "lovism"
  "Hello, your cookie has been set"
end

get '/get_cookie' do
  session[:religion]
end
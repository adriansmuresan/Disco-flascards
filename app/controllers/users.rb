get '/users/login' do
# go to form to login
end

get '/users/logout' do
# end the session and redirect to login page
end

get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(user_name: params[:user_name], email: params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
  else
    erb :'/users/new'
  end
end

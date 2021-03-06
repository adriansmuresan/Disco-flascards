get '/users/login' do
  erb :'users/login'
end

# login

post '/users/login' do
  user = User.find_by(user_name: params[:user_name])
  if user
    user.authenticate(user.user_name, params[:password])
    session[:id] = user.id
    redirect '/decks'
  else
    @errors = "Username and password combo invalid."
    erb :'users/login'
  end
    @errors = "Please enter valid username and password."
    erb :'users/login'
end

delete '/users/logout' do
  session[:id] = nil
  redirect '/users/login'
end

get '/users/new' do
  erb :'/users/new'
end

# register

post '/users' do
  @user = User.new(user_name: params[:user_name], email: params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      @errors = @user.errors.full_messages
      erb :'/users/new'
  end

end

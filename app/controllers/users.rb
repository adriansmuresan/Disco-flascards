get '/users/login' do
  erb :'users/login'
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
      @errors = @user.errors.full_messages
      erb :'/users/new'
  end



end

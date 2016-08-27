get '/' do
  if session[:user_id] == nil
    redirect "/users/login"
  else
    redirect "/decks"
  end
end

get '/session-viewer' do
  session.inspect
end

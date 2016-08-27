get '/' do
  if session[:id] == nil
    redirect "/users/login"
  else
    redirect "/decks"
  end
end

get '/decks' do
  @decks = Deck.all
  erb :"decks/index"
end

get '/decks/:id' do
  @deck = Deck.find(params[:id])
  @card = @deck.cards.first

  erb :"/cards/show"
end
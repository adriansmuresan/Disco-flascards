get '/rounds/:round_id/decks/:deck_id/cards/:card_id' do

    round = Round.find(params[:round_id])
    @card_to_show = round.cards.sample

    erb :'/cards/show'
end

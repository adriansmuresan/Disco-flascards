get '/rounds/:round_id/decks/:deck_id/cards/:card_id' do

    @round = Round.find(params[:round_id])

    #If this is the first card the user is seeing do the sample
    @card_to_show = @round.cards.sample
    #Otherwise get all the cards in the deck and subtract the ones where they guessed correclty and get the sample of that
    erb :'/cards/show'
end


post '/rounds/:round_id/decks/:deck_id/cards/:card_id' do

    @round = Round.find(params[:round_id])
    #Now we're going to create the logic to check the guess of the user


    redirect "/rounds/#{@round.id]}/decks/#{@round.deck.id}/cards/#{params[:card_id]}"
end

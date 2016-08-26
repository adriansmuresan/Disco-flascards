get '/rounds/:round_id/decks/:deck_id/cards/:card_id' do

    @round = Round.find(params[:round_id])

    #If this is the first card the user is seeing do the sample
    @card_to_show = @round.cards.sample
    #Otherwise get all the cards in the deck and subtract the ones where they guessed correctly and get the sample of that
      #find all of the cards
      #find all of the cards where the card.guess.result == true for this round id
      #delete the later from the former
      #give me a .sample of what's leftover


    erb :'/cards/show'
end


post '/rounds/:round_id/decks/:deck_id/cards/:card_id' do

    @round = Round.find(params[:round_id])
    @card = Card.find(params[:card_id])

    @guess_on_table = Guess.find_by(round: @round, card: @card)
    #Now we're going to create the logic to check the guess of the user
    if params[:answer] == @card.answer
      #Check if this card/round combo is already in the guesses table
      #if it is then update the result
      if @guess_on_table != nil
        @guess_on_table.result = true
        @guess_on_table.save
      #otherwise create a new guess
      else
        guess = Guess.new({ round: @round, card: @card, result: true})
        guess.save
      end
    else
      if @guess_on_table != nil
        #do nothing
      else
      guess = Guess.new({ round: @round, card: @card, result: false})
      guess.save
      end
    end


    redirect "/rounds/#{@round.id}/decks/#{@round.deck.id}/cards/#{params[:card_id]}"
end

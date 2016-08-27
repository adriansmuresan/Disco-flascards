get '/rounds/:round_id/decks/:deck_id/cards/next_card' do
    #Find the next card to display and take the user there
    @round = Round.find(params[:round_id])
    @all_guesses = @round.guesses
    @all_cards = Card.all
    @all_correct_cards = []

    #Loop through all_guesses and grab only the ones that are result == true
    @all_guesses.each do |each_guess|
      if each_guess.result == true
        @all_correct_cards << each_guess.card
      end
    end

    #Otherwise get all the cards in the deck and subtract the ones where they guessed correctly and get the sample of that
    @remaining_cards = (@all_cards - @all_correct_cards)

    if @remaining_cards.length > 0
      next_card = @remaining_cards.sample
      redirect "/rounds/#{@round.id}/decks/#{@round.deck.id}/cards/#{next_card.id}"
    else
      redirect "/rounds/#{@round.id}/decks/#{@round.deck.id}/results"
    end
end


get '/rounds/:round_id/decks/:deck_id/cards/:card_id' do

    @round = Round.find(params[:round_id])
    @card_to_show = Card.find(params[:card_id])

    erb :'/cards/show'
end

post '/rounds/:round_id/decks/:deck_id/cards/:card_id' do
    @round = Round.find(params[:round_id])
    @card = Card.find(params[:card_id])

    @guess_result = Guess.query_guess_table(@round, @card, params[:answer])

    #If the user got the guess wrong take them to a page that shows them the right answer
    erb :'cards/answer'
    #otherwise redirect to a page with a new question
    # redirect "/rounds/#{@round.id}/decks/#{@round.deck.id}/cards/#{params[:card_id]}/answer"
end


get '/rounds/:round_id/decks/:deck_id/results' do
  erb :'/users/results'
end

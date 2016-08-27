class Guess < ActiveRecord::Base
  belongs_to :round
  belongs_to :card

  def self.query_guess_table(round, card, user_guess)
    if Guess.exists?(round: round, card: card) && (user_guess.downcase == card.answer.downcase)
      guess = Guess.find_by(round: round, card: card)
      guess.result = true
      guess.save
      round.total_guesses += 1
      round.save
      return true
    elsif Guess.exists?(round: round, card: card) && !(user_guess.downcase == card.answer.downcase)
      round.total_guesses += 1
      round.save
      return false
    elsif !Guess.exists?(round: round, card: card) && (user_guess.downcase == card.answer.downcase)
      Guess.create({ round: round, card: card, result: true})
      round.first_time_correct += 1
      round.total_guesses += 1
      round.save
      return true
    elsif !Guess.exists?(round: round, card: card) && !(user_guess.downcase == card.answer.downcase)
      Guess.create({ round: round, card: card, result: false})
      round.total_guesses += 1
      round.save
      return false
    end
  end

end


# #Now we're going to create the logic to check the guess of the user
# if params[:answer] == @card.answer
#   #Check if this card/round combo is already in the guesses table
#   #if it is then update the result
#   if @guess_on_table != nil
#     @guess_on_table.result = true
#     @guess_on_table.save
#   #otherwise create a new guess
#   else
#     guess = Guess.new({ round: @round, card: @card, result: true})
#     guess.save
#   end
# else
#   if @guess_on_table != nil
#     #do nothing
#   else
#   guess = Guess.new({ round: @round, card: @card, result: false})
#   guess.save
#   end
# end

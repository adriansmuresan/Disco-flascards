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

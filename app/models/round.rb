class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_many :cards, through: :deck, source: :cards
  has_many :guesses, through: :cards, source: :guesses
end

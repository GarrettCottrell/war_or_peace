require './lib/card'
require './lib/deck'
require './lib/player'

class Turn

attr_reader :player1, :player2, :spoils_of_war, :winner, :type

  def initialize(player1,player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = winner_of_turn
    @type = type_of_turn
  end

  def type_of_turn
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    end
  end

  def winner_of_turn
    if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player1
    elsif @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
      @player2
    end
  end

  def pile_cards
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      @spoils_of_war = [@player1, @player2].map do |player|
        player.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    winner.deck.add_card(@spoils_of_war[0])
    winner.deck.add_card(@spoils_of_war[1])
  end
end

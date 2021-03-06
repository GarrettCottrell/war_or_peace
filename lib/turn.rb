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

  if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
    :mutually_assured_destruction

  elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war

  elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic

      end
    end


  def winner_of_turn
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
     'No Winner'
    elsif @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player1
    elsif @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
      @player2
    elsif @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
      @player1
    elsif @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
      @player2
end
end
  def pile_cards
    if type == :mutually_assured_destruction
      [@player1, @player2].each do |player|
      3.times {player.deck.remove_card}
      end
    elsif type == :basic
      @spoils_of_war = [@player1, @player2].map do |player|
        player.deck.remove_card
      end
    elsif type == :war
          [@player1, @player2].each do |player|
          3.times {@spoils_of_war << player.deck.remove_card}
      end
    end
end
  def award_spoils(winner)
    winner.deck.add_card(@spoils_of_war)
    winner.deck.cards.flatten!

  end
end

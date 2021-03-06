require './lib/deck'
require './lib/card'
require './lib/player'
require 'minitest/autorun'
require 'minitest/pride'

class PlayerTest <Minitest::Test
  def setup

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)
  end

  def test_player_exists

  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)
  card3 = Card.new(:heart, 'Ace', 14)

  cards = [card1, card2, card3]
  deck = Deck.new(cards)
  player = Player.new('Clarisa', deck)

  assert_instance_of Player, player
  end

  def test_has_lost?

    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new('Clarisa', deck)

    assert_equal false, player.has_lost?
    player.deck.remove_card
    assert_equal false, player.has_lost?
    player.deck.remove_card
    assert_equal false, player.has_lost?
    player.deck.remove_card
    assert_equal true, player.has_lost?
  end
end

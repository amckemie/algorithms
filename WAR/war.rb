class LinkedList
  attr_reader :front, :back
  def initialize
    @front = nil
    @back = nil
  end

  def add(node, position)
    if @front == nil && @back == nil
      @front = node
      @back = node
    elsif position == :front
      node.in_back = @front
      @front.in_front = node
      @front = node
    else
      node.in_front = @back
      @back.in_back = node
      @back = node
    end
  end

  def remove(position)
    if @front == nil && @back == nil
      nil
    elsif @back == @front
      node = @front
      @back = nil
      @front = nil
      return node
    elsif position == :front
      node = @front
      @front = @front.in_back
      @front.in_front.in_back = nil
      @front.in_front = nil
      return node
    elsif position == :back
      node = @back
      @back = @back.in_front
      @back.in_back.in_front = nil
      @back.in_back = nil
      return node
    end
  end
end

# class Node
#   attr_accessor :in_front, :in_back
#   attr_reader :value
#   def initialize(value)
#     @value = value
#     @in_front = nil
#     @in_back = nil
#   end
# end

# Card class acts as Node for LinkedList
class Card
  attr_reader :rank, :value, :suit
  attr_accessor :in_front, :in_back
=======
# This class is complete. You do not need to alter this
class Card
  # Rank is the rank of the card, 2-10, J, Q, K, A
  # Value is the numeric value of the card, so J = 11, A = 14
  # Suit is the suit of the card, Spades, Diamonds, Clubs or Hearts
  def initialize(rank, value, suit)
    @rank = rank
    @value = value
    @suit = suit

    @in_front = nil
    @in_back = nil
  end
end

# TODO: You will need to complete the methods in this class
class Deck
  attr_accessor :deck
  def initialize
    @deck = LinkedList.new # Determine the best way to hold the cards
  end

  # Given a card, insert it on the bottom your deck
  def add_card(card)
    @deck.add(card, :back)
  end

  # Mix around the order of the cards in your deck
  def shuffle # You can't use .shuffle!

  end

  # Remove the top card from your deck and return it
  def deal_card
    @deck.remove(:front)
  end

  # Reset this deck with 52 cards
  def create_shuffled_deck
    # value = (2..10).to_a
    ranks = (2..10).to_a + ["J", "Q", "k", "A"]
    values = (2..14).to_a
    suits = ["Spades", "Diamonds", "Hearts", "Clubs"]

    # suits.each do |suit|
    #   ranks.each_with_index do |rank|
          # @deck << Card.new(rank, value[index], suit)
      #   end
      # end

    i = 0
    counter = 0
    temp_deck = []
    until i == 4
      (0...ranks.length).each do |j|
        temp_deck << Card.new(ranks[j], values[j], suits[i])
        counter += 1
      end
      i += 1
    end

    #Shuffling cards
    until temp_deck.length == 0
      index = rand(0...temp_deck.length)
      self.add_card(temp_deck[index])
      temp_deck.delete_at(index)
    end
    counter
  end
 end

  # Reset this deck with 52 cards
  def create_52_card_deck

  end
end

# You may or may not need to alter this class
class Player
  attr_reader :hand, :name
  def initialize(name)
    @name = name
    @hand = Deck.new
  end
end


class War
  attr_reader :player1, :player2, :deck
  def initialize(player1, player2)
    @deck = Deck.new
    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
    # You will need to shuffle and pass out the cards to each player
  end
  def deal_cards
    26.times do
      @player1.hand.add_card(@deck.deal_card)
      @player2.hand.add_card(@deck.deal_card)
    end
  end

  def add_player_card(card_hash)
    card_hash.each do |key,value|
      value.each do |card|
        key.hand.add_card(card)
      end
    end
  end

  # You will need to play the entire game in this method using the WarAPI
  def play_game
    num_turns = 0
    # @deck = Deck.new
    @deck.create_shuffled_deck
    deal_cards

    until (@player1.hand.deck.front == nil && @player1.hand.deck.back == nil) || (@player2.hand.deck.front == nil && @player2.hand.deck.back == nil)
      num_turns += 1

      p1_card = @player1.hand.deal_card
      p2_card = @player2.hand.deal_card
      cards = WarAPI.play_turn(@player1, p1_card, @player2, p2_card)
      add_player_card(cards)
    end

    if @player1.hand.deck.front == nil
      puts "#{@player2.name}"
      return num_turns
    else
      puts "#{@player1.name}"
      return num_turns
    end
  end

  def play_100_games
    total = 0
    100.times do
      total += self.play_game
    end

    total/100
  end

  # You will need to play the entire game in this method using the WarAPI
  def play_game
    # WarAPI.play_turn()
  end
end


class WarAPI
  # This method will take a card from each player and
  # return a hash with the cards that each player should receive
  def self.play_turn(player1, card1, player2, card2)
    if card1.value > card2.value
      {player1 => [card1, card2], player2 => []}
<<<<<<< HEAD
    elsif card2.value > card1.value || Random.rand(100).even?
=======
    elsif card2.value > card1.value || Rand(100).even?
>>>>>>> f45e33c8e8ce818ab53aeecf746490ad4f6106d2
      {player1 => [], player2 => [card2, card1]}
    else
      {player1 => [card1, card2], player2 => []}
    end
  end
end

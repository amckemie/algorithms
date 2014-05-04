require 'rubygems'
require 'rspec'
require 'pry-debugger'
require_relative '../war.rb'

describe 'Card' do
  describe 'initialize' do
    it "initializes as a 'Node' with an in_front and in_back pointer" do
      card = Card.new(2, 2, "Spades")
      expect(card.class).to eq(Card)
      expect(card.in_front).to eq(nil)
      expect(card.in_back).to eq(nil)
    end
  end
end


describe 'Deck' do

  before(:each) do
    @deck = Deck.new
    # @deck_array = @deck.deck
  end
  describe 'initialize' do
    it 'initializes as a new LinkedList' do
      expect(@deck.deck.class).to eq(LinkedList)
    end
  end

  describe 'add_card' do
    it "Adds card to bottom of deck/back of the LinkedList" do
      card1 = Card.new("J", 11, "Spades")
      card2 = Card.new("A", 14, "Clubs")
      @deck.add_card(card1)
      @deck.add_card(card2)
      expect(@deck.deck.front).to eq(card1)
      expect(@deck.deck.back).to eq(card2)
    end
  end

  # describe "create_52_card_deck" do
  #   it "makes a 52 card deck/array with 52 elements" do
  #     @deck.create_52_card_deck
  #     expect(@deck.deck.count).to eq(52)
  #   end
  # end

  # describe "shuffle" do
  #   it "shuffles the deck/rearranges the order of the cards" do
  #     @deck.create_52_card_deck
  #     old_deck = @deck
  #     new_deck = @deck.shuffle
  #     expect(new_deck).to_not eq(old_deck)
  #     expect(@deck.deck.count).to eq(52)
  #   end
  # end

  describe "deal_card" do
    it "deals the top card in the deck/changes the front pointer of the LinkedList" do
      card1 = Card.new("J", 11, "Spades")
      card2 = Card.new("A", 14, "Clubs")
      @deck.add_card(card1)
      @deck.add_card(card2)
      test = @deck.deal_card
      expect(test.class).to eq(Card)
      expect(@deck.deck.front).to_not eq(card1)
      expect(@deck.deck.back).to eq(card2)
    end
  end
end

# describe 'Player' do
#   before(:each) do
#     @ashley = Player.new("Ashley")
#   end

#   describe "initialize" do
#     it "initializes with a counter set to 0" do
#       expect(@ashley.counter).to eq(0)
#     end

#     it "initializes with an empty play_deck and hold_deck" do
#       expect(@ashley.play_deck.deck).to eq([])
#       expect(@ashley.hold_deck.deck).to eq([])
#     end
#   end

#   # describe "check_deck" do
#   #   it ""
#   # end

#   # describe "deal_player_card" do
#   #   before(:each) do
#   #     @ashley.play_deck.create_52_card_deck
#   #   end

#   #   it "returns the card at the index of counter" do
#   #     @ashley.play_deck.
#   #   end

#   #   it "sets the deck at index counter to nil" do
#   #   end

#   #   it "counter increments by 1" do
#   #   end

#   #   it ""
#   # end

# end


# describe "War" do
#   describe "create_shuffled_deck" do
#     it "creates a 52 card deck and shuffles it" do
#       war = War.new("ashley", "Clay")
#       war.create_shuffled_deck
#       expect(war.deck.deck.count).to eq(52)
#     end
#   end

#   describe "deal_cards" do
#     it "deals a hand of 26 cards to each player" do
#       war = War.new("ashley", "Clay")
#       war.create_shuffled_deck
#       war.deal_cards

#       p1_hand = war.player1.hand.deck
#       p2_hand = war.player2.hand.deck

#       expect(p1_hand.count).to eq(26)
#       expect(p2_hand.count).to eq(26)
#       expect(p1_hand).to_not eq(p2_hand)
#     end
#   end

#   # describe "play_game" do
#   #   it "gives cards to the winning player for each hand" do
#   #   end

#   #   it "continues until 1 player has all the cards/the other player has none" do
#   #   end

#   #   it "lists who won the game" do

#   #   end
#   # end
# end


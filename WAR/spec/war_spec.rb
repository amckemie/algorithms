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

  describe "create_shuffled_deck" do
    it "makes a 52 card deck/LinkedList" do
      expect(@deck.create_shuffled_deck).to eq(52)
    end

    it "rearranges the order of the cards" do
      @deck.create_shuffled_deck
      deck1 = Deck.new
      deck1.create_shuffled_deck
      expect(@deck.deck.front).to_not eq(deck1.deck.front)
    end
  end

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

describe 'Player' do
  before(:each) do
    @ashley = Player.new("Ashley")
  end

  describe "initialize" do
    it "initializes with a name" do
      expect(@ashley.name).to eq("Ashley")
    end

    it "initializes with an empty hand" do
      expect(@ashley.hand.deck.front).to eq(nil)
      expect(@ashley.hand.deck.front).to eq(nil)
    end
  end

end


describe "War" do
  describe "initialize" do
    it "creates a 52 card deck and shuffles it" do
      war = War.new("ashley", "Clay")
      expect(war.deck.deck.front.class).to eq(Card)
    end
  end

  describe "deal_cards" do
    it "deals a hand of 26 cards to each player" do
      war = War.new("ashley", "Clay")
      temp_deck = war.deck.deck
      war.deal_cards

      p1_hand = war.player1.hand.deck
      p2_hand = war.player2.hand.deck


      expect(p1_hand.front.class).to eq(Card)
      expect(p1_hand.back.class).to eq(Card)
      expect(p2_hand.front.class).to eq(Card)
      expect(p2_hand.back.class).to eq(Card)
      expect(p1_hand.front).to_not eq(p2_hand.front)
      expect(temp_deck.front).to eq(nil)
      expect(temp_deck.back).to eq(nil)
    end
  end
end


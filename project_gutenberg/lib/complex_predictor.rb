require_relative 'predictor'
require 'pry-debugger'


class ComplexPredictor < Predictor
  # Public: Trains the predictor on books in our dataset. This method is called
  # before the predict() method is called.
  #
  # Returns nothing.
  def train!
    @data = {}

    @all_books.each do |category, books|
      @data[category] = {
        words: {}
      }
      books.each do |filename, tokens|
        # First 20% of words are used, last 80% ignored. Gives more weight to intro sections
        for i in (0...tokens.length/5)
          if good_token?(tokens[i])
            if @data[category][:words].has_key?(tokens[i].to_sym)
              @data[category][:words][tokens[i].to_sym] += 1
            else
              @data[category][:words][tokens[i].to_sym] = 1
            end
          end
        end
      end
      data = @data[category][:words].sort_by{|key,value| value}.reverse!
    end
  end

  # Public: Predicts category.
  #
  # tokens - A list of tokens (words).
  #
  # Returns a category.
  def predict(tokens)
    tokens_hash = {}
    for i in (0...tokens.length/5) do
      if good_token?(tokens[i])
        if tokens_hash.has_key?(tokens[i].to_sym)
          tokens_hash[tokens[i].to_sym] += 1
        else
          tokens_hash[tokens[i].to_sym] = 1
        end
      end
    end

    max_word = tokens_hash.max_by{|key,value| value}.first
    min_place = 9999999
    category_holder = nil
    @data.each do |category, words|
      category_words = @data[category][:words].keys
        for i in (0...category_words.length)
          if category_words[i] == max_word && i < min_place
            min_place = i
            category_holder = category
          end
        end
      # end
    end
    category_holder
  end
end

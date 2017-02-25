class Ngram
  attr_reader :n

  def initialize(words, n:)
    @n = n
    @gram = {}
    words.each_cons(n).map do |word_group|
      key = word_group[0...-1]
      @gram[key] ||= []
      @gram[key] = @gram[key].push(word_group.last)
    end
  end

  def stats
    num_keys = gram.keys.count
    num_values = gram.values.map(&:count).inject(0, :+)
    avg_values = (num_values.to_f / num_keys).round(2)

    { num_keys: num_keys, avg_values: avg_values }
  end


  def random_start
    gram.keys.sample
  end

  def generate_sequence(start:, length:)
    next_key = start
    sequence = length.times.map do |_|
      possible_words = gram[next_key]
      if possible_words.nil?
        nil
      else
        possible_words.sample.tap do |chosen_word|
          next_key = next_key[1..-1] << chosen_word
        end
      end
    end

    start + sequence.to_a
  end

  private
  attr_reader :gram
end

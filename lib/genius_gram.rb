require 'genius/album_scraper'
require 'ngram.rb'

class GeniusGram
  DEFAULT_ALBUM_URL = "https://genius.com/albums/Lin-manuel-miranda/Hamilton-original-broadway-cast-recording"

  def initialize(album_url: DEFAULT_ALBUM_URL, n: 3)
    raise "n must be greater than 1" if n <= 1

    @scraped_album = Genius::AlbumScraper.new(album_url: album_url)
    @ngram = Ngram.new(@scraped_album.songs.inject([], :+), n: n)
  end

  def tracklist
    scraped_album.tracklist
  end

  def stats
    ngram.stats
  end

  def make_me_a_song(word_count: 30, line_length: 6)
    raise "Word count must be greater than #{ngram.n - 1}" if word_count < ngram.n
    raise "Line length must be greater than 0" if line_length <= 0

    start = ngram.random_start
    sequence = ngram.generate_sequence(start: start, length: word_count - start.length)
    sequence.each_slice(line_length).map { |line| line.join(" ") }
  end

  private
  attr_reader :ngram, :scraped_album
end

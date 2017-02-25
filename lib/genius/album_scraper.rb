require 'nokogiri'
require 'open-uri'
require 'genius/song_normalizer'

module Genius
  class AlbumScraper
    attr_reader :songs

    def initialize(album_url:)
      @html_doc = Nokogiri::HTML(open(album_url))
      @songs = scrape_songs.map do |song_html|
        SongNormalizer.normalize(song_html).split(" ")
      end
    end

    def tracklist
      html_doc.css(".song_title").map(&:text)
    end

    private
    attr_reader :html_doc

    def tracklist_urls
      html_doc.css(".song_name").map { |a| a["href"] }
    end

    def scrape_songs
      tracklist_urls.map.with_index do |song_url, index|
        puts "Scraping song: #{tracklist[index]}."
        song_html = Nokogiri::HTML(open(song_url))
        song_html.xpath("//lyrics").text
      end
    end
  end
end

module Genius
  module SongNormalizer
    def self.normalize(text)
      text = remove_newlines(text)
      text = remove_stage_directions(text)
      text = remove_punctionation(text)

      text.downcase.squeeze(' ').strip
    end

    def self.remove_newlines(text)
      text.gsub(/\n/, ' ')
    end

    def self.remove_stage_directions(text)
      text.gsub(/\[[^\]]+\]/, ' ').gsub(/\([^\)]+\)/, ' ')
    end

    def self.remove_punctionation(text)
      text.gsub(/[^A-Za-z0-9\s-]/, '')
    end
  end
end

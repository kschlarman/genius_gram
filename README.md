# Genius Gram
A simple (and stupid) Genius lyric scraper and remixer.

This is an unpublished ruby gem for generating remixed lyrics from any album cataloged on [Genius](https://genius.com/). This gem scrapes the lyrics from Genius and creates a [trigram](https://en.wikipedia.org/wiki/N-gram) to generate new sequences of words.

Here's an example from Hamilton:

> you are the odds the gods<br />
would put us all away someday<br />
someday yeah youll blow us all<br />
beware it goeth before the sun<br />
comes up and the hope that<br />
you write

## Usage

```ruby
require 'genius_gram'

album_url = "https://genius.com/albums/Lin-manuel-miranda/Hamilton-original-broadway-cast-recording"

gg = GeniusGram.new(album_url: album_url)
puts gg.make_me_a_song
```

If an `album_url:` is not provided, it will default to Hamilton.

You can also change the word count and line length:
```ruby
puts gg.make_me_a_song(word_count: 100, line_length: 10)
```

## Notes
Hamilton has 46 tracks. Tracks 31-46 are loaded asynchronously on the album's Genius page. Because this gem scrapes with Nokogiri, we're unable to capture the asynchronously loaded tracks.

This works better with some albums than others. Hamilton is ideal due to it's length and many repeating phrases (e.g. "my shot", "talk less smile more", "how does a ...").

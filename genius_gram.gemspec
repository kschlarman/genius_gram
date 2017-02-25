Gem::Specification.new do |s|
  s.name        = 'genius_gram'
  s.version     = '0.0.1'
  s.summary     = "A simple (and stupid) genius lyric parser and remixer."
  s.description = "This gem scrapes the lyrics from Genius and creates a trigram to generate new sequences of words."

  s.required_ruby_version = '>= 2.3'

  s.authors     = ["Kelsey Schlarman"]
  s.email       = 'kschlarman@gmail.com'
  s.homepage    = 'https://github.com/kschlarman/genius_gram'
  s.license     = 'MIT'
  
  s.files = Dir[
    "README.md",
    "lib/**/*",
  ]

  s.add_dependency "nokogiri", "~> 1.6"
end

class Bot < ApplicationRecord


  def self.search_words(words)
    CLIENT.search(words, lang: 'en').first.text
  end

  def self.tweet_random_holy
    response = Wordnik.words.get_random_word(includePartOfSpeech: 'noun')
    word = response['word']
    tweet = 'Holy ' + word + '!'
    puts "about to tweet: #{tweet}"
    CLIENT.update(tweet)

  end

end

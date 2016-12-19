class Bot < ApplicationRecord


  def self.search_words(words)
    CLIENT.search(words, lang: 'en').first.text
  end

  def self.tweet_random_holy
    response = Wordnik.words.get_random_word(includePartOfSpeech: 'noun', minCorpusCount: 2500)
    word = response['word']
    clean_word = word.gsub(/\W+/, '')
    tweet = 'Holy ' + word + '!' + " #" + clean_word
    puts "...about to tweet: #{tweet}"
    CLIENT.update(tweet)

  end

end

require 'pry'
# Write your code here.
def dictionary(word)
  dictionary = {
  "hello" => "hi",
  "to" => "2",
  "two" => "2",
  "too" => "2",
  "for" => "4",
  "four" => "4",
  "be" => "b",
  "you" => "u",
  "at" => "@",
  "and" => "&"
}
dictionary[word]
end

def cap_setting(word)
  if word == word.capitalize
    0
  elsif word == word.upcase
    1
  else
    (-1)
  end
end

def word_substituter(tweet)
  short_tweet = []
  tweet_subs = tweet.split
  tweet_subs.map do |word|
    if dictionary(word.downcase) == nil
      case cap_setting(word)
      when -1
        short_tweet.push(word)
      when 0
        short_tweet.push(word.capitalize)
      when 1
        short_tweet.push(word.upcase)
      end
    else
      case cap_setting(word)
      when -1
        short_tweet.push(dictionary(word))
      when 0
        short_tweet.push(dictionary(word).capitalize)
      when 1
        short_tweet.push(dictionary(word).upcase)
      end
    end
    binding.pry
  end
  short_tweet.join(" ")
end

def bulk_tweet_shortener(tweet_array)
  tweet_array.map {|tweet| puts word_substituter(tweet)}
end

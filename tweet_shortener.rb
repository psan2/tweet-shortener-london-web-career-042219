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
  tweet_subs = tweet.split
  tweet_subs.map! do |word|
    cap = cap_setting(word)
    if dictionary(word.downcase) == nil
      temp_word = word
    else
      temp_word = dictionary(word.downcase)
    end
    case cap
    when -1
      temp_word
    when 0
      temp_word.capitalize
    when 1
      temp_word.upcase
    end
  end
  tweet_subs.join(" ")
end

def bulk_tweet_shortener(tweet_array)
  tweet_array.map {|tweet| puts word_substituter(tweet)}
end

def selective_tweet_shortener(tweet)
  tweet.length > 140 ? word_substituter(tweet) : tweet
end

def shortened_tweet_truncator(tweet)
  selective_tweet_shortener(tweet).length > 140 ? "#{word_substituter(tweet)[0..140]}..." : selective_tweet_shortener(tweet)

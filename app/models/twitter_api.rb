require 'twitter'

class TwitterApi

  def self.client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['YOUR_CONSUMER_KEY']
      config.consumer_secret     = ENV['YOUR_CONSUMER_SECRET']
    end
  end

### Show Tweet of a specific user. Here hardcoded BBC News ###
  # def self.organizer_public_tweets
  #   client.user_timeline("BBCNews", exclude_replies: true, include_rts: false)
  # end
### End of comment ###

### Show Tweet for a specific hashtag ###
  def self.demo_hashtag(hashtag)
    tweets = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['YOUR_CONSUMER_KEY']
      config.consumer_secret     = ENV['YOUR_CONSUMER_SECRET']
    end
    @tweets = tweets.search("##{hashtag} -rt")
  end

### End of comment ###
end

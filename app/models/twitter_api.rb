require 'twitter'

class TwitterApi

  def self.organizer_public_tweets
    client.user_timeline("BBCNews", count: 10, exclude_replies: true, include_rts: false)
  end

  def self.client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['YOUR_CONSUMER_KEY']
      config.consumer_secret     = ENV['YOUR_CONSUMER_SECRET']
    end
  end
end

  # puts client.status('twitter').text

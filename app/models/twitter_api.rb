require 'twitter'

class TwitterApi

  def self.organizer_public_tweets
    client.user_timeline("BBCNews", count: 10, exclude_replies: true, include_rts: false)
  end

### It'll be complicated to monitor.... ###
  # def self.demo_hashtags
  #   client.search("to: <% @demos.name %>", result_type: "recent").take(5).collect do |tweet|
  #   "#{tweet.user.screen_name}: #{tweet.text}"
  #   end
  # end

### END ###

  def self.client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['YOUR_CONSUMER_KEY']
      config.consumer_secret     = ENV['YOUR_CONSUMER_SECRET']
    end
  end
end

  # puts client.status('twitter').text

class TweetWorker
  include Sidekiq::Worker

  def perform(tweet_id)
    tweet = Tweet.find(tweet_id)
    user  = tweet.user
    tweeter = Twitter::Client.new(:oauth_token => user.oauth_token,:oauth_token_secret => user.oauth_secret)
    tweeter.update(tweet.status)

    # set up Twitter OAuth client here
    # actually make API call
    def oauth_consumer
      raise RuntimeError, "You must set TWITTER_KEY and TWITTER_SECRET in your server environment." unless ENV['TWITTER_KEY'] and ENV['TWITTER_SECRET']
      @consumer ||= OAuth::Consumer.new(
        ENV['TWITTER_KEY'],
        ENV['TWITTER_SECRET'],
        :site => "http://api.twitter.com/"
      )
    end

    # Note: this does not have access to controller/view helpers
    # You'll have to re-initialize everything inside here
  end
end

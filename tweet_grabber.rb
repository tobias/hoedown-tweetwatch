require 'tweetstream'

class TweetGrabber

  def initialize(options)
    @search_terms = options['search_terms']
    @queue = TorqueBox::Messaging::Queue.new(options['queue'])
    @running = true
    @tweet_count = 0
  end

  def start
    @thread = Thread.new { run }
  end

  def stop
    @running = false
    @thread.join
  end
  
  def run
    puts "Starting TweetGrabber with #{@search_terms}"
    
    TweetStream::Client.new(ENV['USERNAME'], ENV['PASSWORD']).on_error do |message|
      puts "TweetGrabber: an error occurred - #{message}"
    end.track(*@search_terms) do |tweet, client|
      @tweet_count += 1
      puts "TweetGrabber: I've processed #{@tweet_count} tweets" if @tweet_count % 50 == 0
      
      if @running
        @queue.publish( :message => tweet[:text], :sender => tweet[:user][:screen_name], :timestamp => Time.now.ctime )
      else
        puts "TweetGrabber: shutting down (#{@tweet_count} tweets processed)"
        client.stop
      end

    end
  end
  
end

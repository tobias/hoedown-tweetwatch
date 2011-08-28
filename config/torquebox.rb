TorqueBox.configure do

  service TweetGrabber do
    config( :search_terms => %w{ hurricane }, :queue => '/queue/tweets' )
  end

  queue '/queue/tweets' do
    processor BorkBorkBorkProcessor do
      concurrency 5
      config( :topic => '/topic/messages' )
    end
  end

  topic '/topic/messages'

  stomplet TweetStomplet do
    route '/stomplet/messages'
    config( :topic => '/topic/messages' )
  end

  environment do
    USERNAME 'changeme'
    PASSWORD 'me too!'
  end

end

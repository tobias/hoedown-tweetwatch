require 'torquebox-stomp'
require 'json'

class TweetStomplet < TorqueBox::Stomp::JmsStomplet

  def configure(opts)
    super
    @topic = TorqueBox::Messaging::Topic.new( opts[:topic] )
  end

  def on_subscribe(subscriber)
    subscribe_to( subscriber, @topic )
    send_to( @topic,
             {
               :message => "Someone joined",
               :sender => 'the_boss',
               :timestamp => Time.now.ctime,
               :type => :notice
             }.to_json )
  end

end

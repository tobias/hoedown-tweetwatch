require 'torquebox-messaging'
require 'cheferize'
require 'json'

class String; include Cheferize; end

class BorkBorkBorkProcessor < TorqueBox::Messaging::MessageProcessor

  def initialize(opts)
    @topic = TorqueBox::Messaging::Topic.new( opts['topic'] )
  end
  
  def on_message(data)
    data[:message] = data[:message].to_chef
    data[:type] = :tweet
    @topic.publish( data.to_json )
  end
end

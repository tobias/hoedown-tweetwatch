# TweetWatch w/WebSockets

This is a TorqueBox demo app that uses the TorqueBox configuration
DSL and the STOMP over WebSockets support. It searches Twitter for
a given set of search terms, converts them to Swedish chef, and 
delivers them to any connected browsers via STOMP over WebSockets.

## To Deploy

Install jruby-1.6.4 (and mayhap create a gemset as well):

    $ rvm install jruby-1.6.4@tweetwatch
    
Then install bundler and run `bundle`:

    $ gem install bundler
    $ bundle install 

This will install the TorqueBox via torquebox-server gem (among other 
things) which is quite large, so this step may take a while.
   
Edit `config/torquebox.rb` and set your twitter username and 
password in the `environment` block. You can also change the
search terms in block for the `TweetGrabber` service.
   
Deploy the app and run it via the `torquebox` command 
(installed with the torquebox-server gem):
   
    $ torquebox deploy .
    $ torquebox run

## To Use

Visit http://localhost:8080/ in a modern browser (I've 
tested this app with Chrome and Safari).
   
## To Learn More

If you are interested in the TorqueBox WebSockets support, 
read the blog post series on the subject at:
http://torquebox.org/news/2011/08/23/stomp-chat-demo-part1/

If you have any trouble, come find me in #torquebox on freenode.

This app uses and includes the cheferize library: https://github.com/alexdean/cheferize

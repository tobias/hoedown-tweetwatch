# TweetWatch w/WebSockets

This is a TorqueBox demo app that uses the TorqueBox configuration
DSL and the STOMP over WebSockets support.

## To Use

1. Install jruby-1.6.4 (and mayhap create a gemset as well):

       $ rvm install jruby-1.6.4@tweetwatch
    
2. Install bundler and run `bundle`:

       $ gem install bundler
       $ bundle install 
   
3. Edit `config/torquebox.rb` and set your twitter username and 
   password in the `environment` block. You can also change the
   search terms in block for the `TweetGrabber` service.
   
4. Deploy the app and run it via the `torquebox` command 
   (installed with the torquebox-server gem):
   
       $ torquebox deploy .
       $ torquebox run

4. Visit http://localhost:8080/ in a modern browser (I've 
   tested this app with Chrome and Safari).
   
If you have any trouble, come find me in #torquebox on freenode.

This app uses and includes the cheferize library: https://github.com/alexdean/cheferize

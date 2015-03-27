#!/usr/bin/env ruby
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '.', 'lib')

require 'rubygems'
require 'chatterbot/dsl'
#require 'url_expander'
require 'uri'
require 'net/http'

def lengthen(url)
  uri = URI(url)
  Net::HTTP.new(uri.host, uri.port).get(uri.path).header['location']
end

#
# this is the script for the twitter bot Deal_Beasting
# generated on 2015-03-27 12:27:33 -0500
#

consumer_key "GA8nFAyaOnqrlJPtDPA9yZViM"
consumer_secret "RnunQ9WEIRA5460BKNa274THxAB8PEfI0IFY3rlUWFUo8Fup4M"

# remove this to send out tweets
#debug_mode

# remove this to update the db
#no_update
# remove this to get less output when running
#verbose

# here's a list of users to ignore
#blacklist "abc", "def"

# here's a list of things to exclude from searches
#exclude "hi", "spammer", "junk"

since_id 581365098209509376
search "from:amazondeals" do |tweet|
  if url = /http:\/\/.*$/.match(tweet.text)
    puts "#{url.to_s} => "
    #puts UrlExpander::Client.expand(url.to_s, :config_file => "./url_expander_credentials.yml")
    puts lengthen(lengthen(url.to_s))
  end
  #tweet tweet.text
end

# replies do |tweet|
#   reply "Yes #USER#, you are very kind to say that!", tweet
# end

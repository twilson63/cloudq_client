$:.unshift File.dirname(__FILE__)

require 'lib/cloudq/connection'
require 'lib/cloudq/consume'

class FaxSend
  def self.perform(*args)
    puts "Fax Stuff"

  end
end

Cloudq::Connection.url = 'https://cloudq.heroku.com'

Cloudq::Worker.new(:fax).run do
  print "."
  sleep 1
end

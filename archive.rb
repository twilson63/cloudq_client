$:.unshift File.dirname(__FILE__)

require 'lib/cloudq/connection'
require 'lib/cloudq/consume'

class Archive
  def self.perform(*args)
    puts "Archive Stuff"
  end
end

Cloudq::Connection.url = 'http://cloudq.heroku.com'

loop do
  print "."
  Cloudq::Consume.job :archive
  sleep 5
end


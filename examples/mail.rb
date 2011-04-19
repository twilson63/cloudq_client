$:.unshift File.dirname(__FILE__)

require 'lib/cloudq/connection'
require 'lib/cloudq/consume'

class Mail
  def self.perform(*args)
    puts "Mail Stuff"
  end
end

Cloudq::Connection.url = 'http://cloudq.heroku.com'

loop do
  print "."
  Cloudq::Consume.job :mail
  sleep 5
end


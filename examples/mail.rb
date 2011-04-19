$:.unshift File.dirname(__FILE__)

require 'lib/cloudq/connection'
require 'lib/cloudq/consume'

class Mail
  def self.perform(*args)
    puts "Mail Stuff"
  end
end

Cloudq::Connection.url = 'http://cloudq.heroku.com'

Cloudq::Worker.new(:mail).run do
  print "."
  sleep 1
end


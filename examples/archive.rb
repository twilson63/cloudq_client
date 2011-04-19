$:.unshift File.join(File.dirname(__FILE__), '..','lib')

require 'cloudq'

class Archive
  def self.perform(*args)
    puts "Archive Stuff - #{args.first['hello']}"
  end
end

Cloudq::Connection.url = 'http://cloudq.heroku.com'

loop do
  print "."
  Cloudq::Consume.new(:archive).job
  sleep 5
end


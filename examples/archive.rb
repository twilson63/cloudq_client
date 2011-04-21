$:.unshift File.join(File.dirname(__FILE__), '..','lib')

require 'cloudq'

class Archive
  def self.perform(*args)
    puts args.first.inspect
  end
end

Cloudq::Connection.url = 'http://cloudq.heroku.com'

Cloudq::Worker.new(:archive).run do
  print "."
  sleep 1
end


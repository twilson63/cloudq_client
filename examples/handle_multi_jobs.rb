$:.unshift File.join(File.dirname(__FILE__), '..','lib')

require 'cloudq'

class Archive
  def self.perform(*args)
    puts "Archive Stuff - #{args.first['hello']}"
  end
end

class Mail
  def self.perform(*args)
    puts "Mail Stuff - #{args.first['to']}"
  end
end

Cloudq::Connection.url = 'http://cloudq.heroku.com'

Cloudq::Worker.new(:archive, :mail).run do
  print "."
  sleep 1
end
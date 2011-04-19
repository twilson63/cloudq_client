$:.unshift File.join(File.dirname(__FILE__), '..','lib')

require 'cloudq'

Cloudq::Connection.url = 'http://cloudq.heroku.com'

100.times do
  Cloudq::Publish.new(:archive).job 'Archive', :hello => 'World'
  Cloudq::Publish.new(:mail).job 'Mail', :to => 'Fred'
end

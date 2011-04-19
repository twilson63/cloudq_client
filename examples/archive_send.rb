$:.unshift File.join(File.dirname(__FILE__), '..','lib')

require 'cloudq'

Cloudq::Connection.url = 'http://cloudq.heroku.com'

Cloudq::Publish.new(:archive).job 'Archive', :hello => 'World'


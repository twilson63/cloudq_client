require 'spec_helper'

describe Cloudq::Publish do
  subject { Cloudq::Publish.new(:myqueue) }

  it 'job to server' do
    Cloudq::Connection.url = "http://cloudq.heroku.com"
    #Cloudq::Connection.url = "http://localhost:3000"
    subject.job('Archive', :hello => :world).should be_true
  end


end


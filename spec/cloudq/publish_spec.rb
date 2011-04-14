require 'spec_helper'

describe Cloudq::Publish do

  it 'job to server' do
    Cloudq::Connection.url = "http://cloudq.heroku.com"
    subject.job('myqueue', 'Archive')
  end


end


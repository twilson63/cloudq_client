require 'spec_helper'

describe Cloudq::Consume do
  it 'consumes job' do
    Cloudq::Connection.url = "http://cloudq.heroku.com"
    subject.job(:myqueue)
  end

  it 'performs job'
end


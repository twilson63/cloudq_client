require 'spec_helper'

describe Cloudq::Publish do

  it 'job to server' do
    Cloudq::Connection.url = "http://localhost:3000"
    puts subject.job('myqueue', 'Archive', :hello => :world)
  end


end


require 'spec_helper'

class Archive
  def self.perform(*args)
    puts 'Archiving!'
  end

end

describe Cloudq::Consume do
  subject { Cloudq::Consume.new(:myqueue) }
  before do
    #Cloudq::Connection.url = "http://localhost:3000"
    Cloudq::Connection.url = "http://cloudq.heroku.com"
    Cloudq::Publish.new(:myqueue).job('Archive', :hello => 'World')
  end
  it 'consumes job' do
    subject.job.should be_true
  end

end


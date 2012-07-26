require 'spec_helper'

describe Cloudq::Publish do
  subject { Cloudq::Publish.new(:myqueue) }
  before do
    Cloudq::Connection.url = "http://localhost:3000"
  end

  it 'should jsonize job' do
    subject.send(:jsonize, {:job => {:klass => 'Archive', :args => [{:hello => 'world'}]}}).should == %Q{{"job":{"klass":"Archive","args":[{"hello":"world"}]}}}
  end

  it 'a job to the queue successfully' do
    RestClient.should_receive(:post).and_return('{"status": "success"}')
    subject.job('Archive', 'awesome','sauce').should be_true
  end

  it 'a job to the queue unsuccessfully' do
    RestClient.should_receive(:post).and_return('{"status": "failed"}')
    subject.job('Archive', :hello => :world).should be_false
  end


end


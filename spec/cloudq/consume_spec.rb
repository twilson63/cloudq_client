require 'spec_helper'

class Archive
  def self.perform(*args)
    puts args.inspect
    puts 'Archiving!'
  end

end

describe Cloudq::Consume do
  subject { Cloudq::Consume.new(:myqueue) }
  context 'successfully' do
    before do
      Cloudq::Connection.url = "http://localhost:3000"
      RestClient.should_receive(:get).and_return('{"klass": "Archive", "args": {"hello": "World"}}')
    end
    it 'consumes job' do
      Cloudq::Publish.new(:myqueue).job('Archive', 'hello','world')
      subject.job.should be_true
    end
  end

  # context 'unsuccessfully' do
  #   before do
  #     Cloudq::Connection.url = "http://localhost:3000"
  #     RestClient.should_receive(:get).and_return('{"status": "empty"}')
  #   end
  #   it 'consumes job' do
  #     subject.job.should == '{"status": "empty"}'
  #   end

  # end

end


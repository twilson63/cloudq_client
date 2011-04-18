require 'spec_helper'

class Archive
  def self.perform(*args)
    puts 'Archiving!'
  end

end

describe Cloudq::Consume do
  subject { Cloudq::Consume.new(:myqueue) }
  it 'consumes job' do
    Cloudq::Connection.url = "http://localhost:3000"
    subject.job

    #puts subject.job(:myqueue)
    
  end

  it 'performs job'
end


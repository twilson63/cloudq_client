require 'spec_helper'

describe Cloudq::Connection do

  it 'sets url' do
    subject.url = 'FooBar'
    subject.url.should == 'FooBar'
  end
end


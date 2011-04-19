require 'spec_helper'

describe Cloudq::Connection do
  it 'url should be valid' do
    lambda { subject.url = 'http://user:password@hostname' }.should_not raise_error
  end

  it 'url should not be valid' do
    lambda { subject.url = 'FooBar' }.should raise_error
  end


end


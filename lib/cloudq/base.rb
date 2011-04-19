module Cloudq
  class Base
    attr_accessor :queue

    def initialize(queue = nil)
      @queue = queue
    end
  end
end

# Cloudq Client Worker

# A Worker is a process that subscribes to a queue and
# Processes Jobs from that queue
#
# This worker makes it super simple to subscribe to a queue

# Cloudq::Worker.new(:queue1, :queue2, :queue3).run do
#   print '.'
#   sleep 2
# end


module Cloudq
  class Worker
    attr_accessor :queues

    def initialize(*args)
      @queues = args
    end

    def run(&block)
      loop do
        @queues.each { |q| Consume.new(q).job }
        yield
      end
    end
  end
end

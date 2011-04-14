require 'rest-client'
require 'json'

module Cloudq
  module Consume
    extend self

    include Cloudq::Helpers

    def job(queue)
      a_job = get queue
      perform a_job
      delete queue, a_job["id"] 
    end

  private
    def peform(a_job)
      klass = Object.const_get(a_job["klass"])
      klass.perform(a_job["args"])
    end
    
    def get(queue)
      JSON.parse(RestClient.get [Cloudq::Connection.url, queue])
    end

    def delete(queue, job_id)
      RestClient.delete [Cloudq::Connection.url, queue, job_id].join('/')
    end

 

  end
end

    

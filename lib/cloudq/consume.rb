require 'rest-client'
require 'json'

module Cloudq
  module Consume
    extend self

    def job(queue)
      a_job = get queue
      if a_job
        perform a_job
        delete queue, a_job["id"] 
      end
    end

  private
    def perform(a_job)
      puts 'called perform'
      klass = Object.const_get(a_job["klass"])
      klass.perform(a_job["args"])
    end
    
    def get(queue)
      response = RestClient.get [Cloudq::Connection.url, queue].join('/')
      return nil if response == 'empty'
      JSON.parse(response) 
    end

    def delete(queue, job_id)
      RestClient.delete [Cloudq::Connection.url, queue, job_id].join('/')
    end

 

  end
end

    

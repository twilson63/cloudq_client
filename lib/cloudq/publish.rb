require 'rest-client'
require 'json'

module Cloudq
  module Publish
    extend self

    def job(queue, klass, *args)
      post(queue, :job => { :klass => klass, :args => args} )
    end

  private
    def post(queue, job)
      RestClient.post [Cloudq::Connection.url, queue].join('/'), job.to_json
    end


  end
end

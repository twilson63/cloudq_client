require 'rest-client'
require 'json'

module Cloudq
  class Publish < Base
    def job(klass, *args)
      post(:job => { :klass => klass, :args => args} )
    end

  private
    def post(job)
      headers = {:content_type => :json, :accept => :json}
      RestClient.post [Cloudq::Connection.url, @queue].join('/'), job, headers do |response|
        JSON.parse(response)['status'] == 'success'
      end
    end


  end
end

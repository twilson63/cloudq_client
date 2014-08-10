module Cloudq
  class Consume < Base
    def job
      get do |a_job|
        perform a_job
        delete a_job["id"]
      end
    end

  private
    def perform(a_job)
      klass = Object.const_get(a_job["klass"])
      klass.perform(*a_job["args"])
    end

    def get(&block)
      resp = RestClient::Request.execute(:method => :get, :url => url, :timeout => 20000, :open_timeout => 20000)
      if resp.code == 200
        result = JSON.parse(resp)
        return nil if result['status'] == 'empty'
        yield result
        result
      end

      # RestClient.get url do |response|
      #   if response.code == 200
      #     result = JSON.parse(response)
      #     return nil if result['status'] == 'empty'
      #     yield result
      #     result
      #   end
      # end
    end

    def delete(job_id)
      RestClient.delete [url, job_id].join('/')
    end

    def url
      [Cloudq::Connection.url, @queue].join('/')
    end



  end
end



module Cloudq
  class Request < Base
    def job
      get do |a_job|
        yield job
      end
    end

  private

    def get(&block)
      resp = RestClient.get url
      if resp.code == 200
        result = JSON.parse(resp)
        return nil if result['status'] == 'empty'
        yield result
        result
      end
    end

    def url
      [Cloudq::Connection.url, @queue].join('/')
    end
  end
end



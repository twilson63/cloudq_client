module Cloudq
  class Request < Base
    def job
      get 
    end

  private

    def get
      resp = RestClient.get url
      if resp.code == 200
        result = JSON.parse(resp)
        return nil if result['status'] == 'empty'
        result
      end
    end

    def url
      [Cloudq::Connection.url, @queue].join('/')
    end
  end
end



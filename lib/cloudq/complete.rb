module Cloudq
  class Complete < Base
    def job(job_id)
      remove(job_id)
    end

  private

    def remove(job_id)
      RestClient.delete [url, job_id].join('/')
    end

    def url
      [Cloudq::Connection.url, @queue].join('/')
    end
  end
end



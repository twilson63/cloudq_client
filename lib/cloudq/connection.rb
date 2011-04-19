module Cloudq
  module Connection
    extend self

    def url
      @url
    end

    def url=(uri)
      raise "Bad URL" unless uri =~ /^http/
      @url = uri
    end

  end
end


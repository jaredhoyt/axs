require "faraday"
require "faraday_middleware"

module Eventbrite
  # The client holds a Faraday connection to the Eventbrite API.
  # The get/post methods receive a uri (e.g. orders/create) and params, and wraps
  # the Faraday response with an Eventbrite::Response object.
  class Client
    def connection
      @connection ||= Faraday.new(url: config.endpoint, proxy: config.proxy) do |conn|
        conn.use FaradayMiddleware::FollowRedirects
        conn.request :json
        conn.response :json
        conn.adapter Faraday.default_adapter
      end
    end

    def call(method, path, params={}, &block)
      raw_response = connection.public_send(method, path, params, &block)
      Response.new(raw_response)
    end

    [:get, :post, :put, :delete].each do |method|
      define_method(method) do |path, params={}, &block|
        call(method, path, params, &block)
      end
    end

    private

    def config
      Eventbrite.config
    end
  end
end

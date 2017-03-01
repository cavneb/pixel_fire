require "rack"

module Rack
  class PixelFire
    def initialize(app)
      @app = app
    end

    def call(env)
      @status, @headers, @body = @app.call(env)
      return [@status, @headers, @body] unless html?
      response = ::Rack::Response.new([], @status, @headers)

      @body.each { |fragment| response.write inject(env, fragment) }
      @body.close if @body.respond_to?(:close)

      response.finish
    end

    def html?
      @headers['Content-Type'] =~ /html/
    end

    def inject(env, response)
      puts "TAGS: #{tags(env).inspect}"
      tags(env).each do |tag|
        response.sub! %r{</#{tag.target}>} do |m|
          tag.custom_html << m.to_s
        end
      end
      response
    end

    def tags(env)
      return [] if env["PATH_INFO"] =~ /\A.*\/pixel_fire.*\Z/
      ::PixelFire::Trigger.matches(env["PATH_INFO"]).map(&:tags).flatten.uniq
    end
  end
end

module Rack
  class PixelFire::Railtie < Rails::Railtie
    initializer "rack.pixel_fire.initializer" do |app|
      app.middleware.use Rack::PixelFire
    end
  end
end
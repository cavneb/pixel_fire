$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pixel_fire/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pixel_fire"
  s.version     = PixelFire::VERSION
  s.authors     = ["Eric Berry"]
  s.email       = ["cavneb@gmail.com"]
  s.homepage    = "https://github.com/cavneb/pixel_fire"
  s.summary     = "Rails engine for embedding pixels (similar to Google Tag Manager)"
  s.description = "Rails engine for embedding pixels (similar to Google Tag Manager)"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.1"

  s.add_development_dependency "sqlite3"
end

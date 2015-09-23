$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "vis_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "vis_engine"
  s.version     = VisEngine::VERSION
  s.authors     = ["Curran Kelleher"]
  s.email       = ["curran@alpinenow.com"]
  s.homepage    = ""
  s.summary     = "Summary of VisEngine."
  s.description = "Description of VisEngine."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "4.1.10"
  # s.add_dependency "jquery-rails"
end

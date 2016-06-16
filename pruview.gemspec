# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pruview/version"

Gem::Specification.new do |gem|
  gem.name        = "pruview"
  gem.version     = Pruview::VERSION
  gem.authors     = ["Kelly Redding", "Collin Redding"]
  gem.email       = ["kelly@kellyredding.com", "collin.redding@me.com"]
  gem.summary     = "generate image previews (thumbnails) in Ruby"
  gem.description = "generate image previews (thumbnails) in Ruby"
  gem.homepage    = "http://github.com/redding/pruview"
  gem.license     = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency("assert", ["~> 2.16.1"])

  gem.add_dependency("mini_magick", ["~> 4.0.0"])
  gem.add_dependency("flvtool2")

end

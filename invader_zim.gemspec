
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "invader_zim/version"

Gem::Specification.new do |spec|
  spec.name          = "invader_zim"
  spec.version       = InvaderZim::VERSION
  spec.authors       = ["'David Mathew Anderson'"]
  spec.email         = ["'matandersonlv@hotmail.com'"]
  spec.date          = "2019-04-20"

  spec.summary       = "Invader Zim Cli Experience"
  spec.description   = "Provides an interactive CLI experience to learn about different Invader Zim Characters"
  spec.homepage      = "https://github.com/mat0829/invader_zim"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
  spec.add_development_dependency "cli-colorize", "~> 2.0"
  spec.add_development_dependency "mini_magick", "~> 4.7"
  spec.add_development_dependency "catpix_mini", "~> 0.1.1"
  spec.add_development_dependency "tco", "~> 0.1.8"
end

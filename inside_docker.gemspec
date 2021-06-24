
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "inside_docker/version"

Gem::Specification.new do |spec|
  spec.name          = "inside_docker"
  spec.version       = InsideDocker::VERSION
  spec.authors       = ["Younes SERRAJ"]
  spec.email         = ["younes.serraj@gmail.com"]

  spec.summary       = %q{Check whether you are running inside a docker container}
  spec.description   = %q{Ruby on Rails gem that checks whether you are running inside a docker container}
  spec.homepage      = "https://github.com/yoones/inside_docker"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

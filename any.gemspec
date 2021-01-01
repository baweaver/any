
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "any/version"

Gem::Specification.new do |spec|
  spec.name          = "any"
  spec.version       = Any::VERSION
  spec.authors       = ["Brandon Weaver"]
  spec.email         = ["keystonelemur@gmail.com"]

  spec.summary       = %q{An Any type, much like Scala, that matches anything.}
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/baweaver/any"
  spec.license       = "MIT"

  spec.metadata      = {
    "source_code_uri" => "https://github.com/baweaver/any",
    "bug_tracker_uri" => "https://github.com/baweaver/any/issues",
  }

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "qo", '0.3.0'
end

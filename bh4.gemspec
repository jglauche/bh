# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bh4/version'

Gem::Specification.new do |spec|
  spec.name          = "bh4"
  spec.version       = Bh4::VERSION
  spec.authors       = ["Jennifer Glauche", "Claudio Baccigalupo"]
  spec.email         = ["=^.^=@bh4.jglauche.de", "claudio@fullscreen.net"]
  spec.description   = %q{Bh4 - Bootstrap 4 Helpers}
  spec.summary       = %q{Bh4 provides a set of powerful helpers that
    streamlines the use of Bootstrap components in Rails views.}
  spec.homepage      = "http://github.com/Fullscreen/bh"
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 1.9.3'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport'                # versioned in gemfiles/
  spec.add_dependency 'actionpack'                   # versioned in gemfiles/

  # For development / Code coverage / Documentation
  spec.add_development_dependency 'bundler',         '~> 1.1'
  spec.add_development_dependency 'rspec',           '~> 3.1'
  spec.add_development_dependency 'rake',            '~> 10.3'
  spec.add_development_dependency 'yard',            '~> 0.8.7'
  spec.add_development_dependency 'coveralls',       '~> 0.8.13'
  spec.add_development_dependency 'activemodel'      # versioned in gemfiles/

  unless ENV['ONLY_RAILS']
    # For spec/dummy
    spec.add_development_dependency 'middleman-core'   # versioned in gemfiles/

    # For Middleman/Padrino tests
    spec.add_development_dependency 'padrino-helpers', '~> 0.12.4'
    spec.add_development_dependency 'padrino-routing', '~> 0.5.0'
  end
end

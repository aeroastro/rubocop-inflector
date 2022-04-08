# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubocop/inflector/version'

Gem::Specification.new do |spec|
  spec.name          = 'rubocop-inflector'
  spec.version       = RuboCop::Inflector::VERSION
  spec.authors       = ['Takumasa Ochi']
  spec.email         = ['aeroastro007@gmail.com']

  spec.summary       = 'RuboCop extension to integrate ActiveSupport::Inflector'
  spec.description   = 'RuboCop extension to integrate ActiveSupport::Inflector'
  spec.homepage      = 'https://github.com/aeroastro/rubocop-inflector'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.3'

  spec.add_dependency 'activesupport'
  spec.add_dependency 'rubocop'
  spec.add_dependency 'rubocop-rspec'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end

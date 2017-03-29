# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name          = "mech"
  gem.version       = '0.1.0'
  gem.summary       = %q{Mech game}
  gem.description   = %q{Mech game using XBox 360 controller}
  gem.license       = "GPL"
  gem.authors       = ["Jan Wedekind"]
  gem.email         = "jan@wedesoft.de"
  gem.homepage      = "https://rubygems.org/gems/mech"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'ruby-sdl2', '~> 0.3'

  gem.add_development_dependency 'bundler', '~> 1.7'
  gem.add_development_dependency 'rake', '~> 10.0'
  gem.add_development_dependency 'rspec', '~> 3.0'
end

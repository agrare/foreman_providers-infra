require File.expand_path('../lib/foreman_providers_infra/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'foreman_providers_infra'
  s.version     = ForemanProvidersInfra::VERSION
  s.license     = 'GPL-3.0'
  s.authors     = ['Adam Grare', 'Ladislav Smola', 'James Wong']
  s.email       = ['agrare@redhat.com', 'lsmola@redhat.com', 'jwong@redhat.com']
  s.homepage    = 'https://github.com/agrare/foreman_providers-infra'
  s.summary     = 'Foreman Infra Providers plugin.'
  # also update locale/gemspec.rb
  s.description = 'Foreman Infrastructure Providers plugin.'

  s.files = Dir['{app,config,db,lib,locale}/**/*'] + ['LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rdoc'
end

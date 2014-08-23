$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__)) + '/lib/'
require 'kramdown-rails/version'
Gem::Specification.new do |s|
  s.name = 'kramdown-rails'
  s.version = KramdownRails::VERSION.version
  s.summary = 'Kramdown injection for Rails'
  s.author = 'Chris Roberts'
  s.email = 'code@chrisroberts.org'
  s.homepage = 'https://github.com/chrisroberts/kramdown-rails'
  s.description = 'Kramdown injection for Rails'
  s.require_path = 'lib'
  s.license = 'MIT'
  s.add_dependency 'kramdown'
  s.files = Dir['lib/**/*'] + %w(kramdown-rails.gemspec README.md CHANGELOG.md)
end

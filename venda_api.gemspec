# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'venda_api/version'

Gem::Specification.new do |s|
  s.name        = "venda_api"
  s.version     = VendaApi::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["mikelarkin"]
  s.email       = []
  s.homepage    = "http://github.com/mikelarkin/venda_api"
  s.summary     = "Implementation of the Venda API"
  s.description = "Implementation of the Venda API"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "venda_api"

  s.add_development_dependency "bundler", ">= 1.0.0.rc.5"
  s.add_development_dependency "rspec"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").select{|f| f =~ /^bin/}
  s.require_path = 'lib'
  s.add_dependency 'savon'
end
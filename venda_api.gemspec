# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'venda_api/version'

Gem::Specification.new do |s|
  s.name        = "venda_api"
  s.version     = VendaApi::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["mikelarkin"]
  s.licenses    = ["MIT"]
  s.email       = [""]
  s.homepage    = "http://github.com/mikelarkin/venda_api"
  s.summary     = "Partial implementation of Venda API"
  s.description = "Specific Implementation of the Venda API for FetchApp"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "venda_api"

  # s.add_development_dependency "bundler", ">= 1.0.0.rc.5"
  s.add_development_dependency "rspec", "3.2.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").select{|f| f =~ /^bin/}
  s.require_path = 'lib'
  s.add_dependency 'savon', '2.9.0'
end
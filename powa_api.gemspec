# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'powa_api/version'

Gem::Specification.new do |s|
  s.name        = "powa_api"
  s.version     = PowaApi::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["jzw"]
  s.email       = []
  s.homepage    = "http://rubygems.org/gems/powa_api"
  s.summary     = "Implementation of the Powa API"
  s.description = "Implementation of the Powa API"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "powa_api"

  s.add_development_dependency "bundler", ">= 1.0.0.rc.5"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").select{|f| f =~ /^bin/}
  s.require_path = 'lib'
  s.add_dependency 'savon'
end
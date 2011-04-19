# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'cloudq/version'

Gem::Specification.new do |s|
  s.name        = "cloudq_client"
  s.version     = Cloudq::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tom Wilson"]
  s.email       = ["tom@jackhq.com"]
  s.homepage    = "http://github.com/twilson63/cloudq_client"
  s.summary     = "A Ruby Interface to the Cloudq"
  s.description = "The Cloudq will "

  s.required_rubygems_version = ">= 1.3.6"

  s.add_development_dependency "rspec", ">= 2.5.0"

  s.add_dependency "rest-client", ">= 1.6.1"

  s.files        = Dir.glob("{bin,lib}/**/*") + %w(LICENSE readme.md)
  s.require_path = 'lib'
end


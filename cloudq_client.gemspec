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
  s.description = "The Cloudq Client gem is an awesome client interface to the cloudq a remote job queue engine that allows you to publish jobs and subscribe from jobs anywhere in the cloud.... "
  s.required_rubygems_version = ">= 1.3.6"
  s.add_development_dependency "rspec", ">= 2.5.0"
  s.add_dependency "rest-client", ">= 1.6.1"
  s.add_dependency "backports", ">= 0"
  s.add_dependency "json", ">= 0"
  s.license       = 'MIT'

  s.files        = Dir.glob("{lib}/**/*") + %w(LICENSE readme.md)
  s.require_path = 'lib'
end


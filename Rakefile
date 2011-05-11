# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "sinatra-ignore-file"
  gem.homepage = "http://github.com/ymmtmsys/sinatra-ignore-file"
  gem.license = "MIT"
  gem.summary = %Q{Ignores the presence of static files.}
  gem.description = %Q{Ignores the presence of static files.}
  gem.email = "m2yamamoto@gmail.com"
  gem.authors = ["ymmtmsys"]
  gem.add_dependency 'sinatra', '>= 1.0'
  gem.files = ["lib/sinatra/*.rb"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new

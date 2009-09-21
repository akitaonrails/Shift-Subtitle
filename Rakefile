require "rubygems"
require 'rubygems/gem_runner'
require "rake/gempackagetask"
require 'spec/rake/spectask'
require 'lib/srt_time/version'

desc "Run all specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ['--options', 'spec/spec.opts']
end

Dir['tasks/**/*.rake'].each { |rake| load rake }
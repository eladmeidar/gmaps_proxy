require 'rubygems'
require 'rake'


begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "gmaps_proxy"
    gem.summary = %Q{Enable GoogleMaps access simple access to countries that can't use the API (israel for example)}
    gem.description = %Q{Due to some rights issues, some countries does not appear with full information on Google Maps API, this library offers a simple hack to make it easier to implement a simple map fragment in your application}
    gem.email = "elad@eizesus.com"
    gem.homepage = "http://github.com/eladmeidar/gmaps_proxy"
    gem.authors = ["Elad Meidar", "Ziv Perry"]
    gem.add_dependency 'nokogiri', ">=0"
    gem.add_development_dependency "thoughtbot-shoulda", ">= 0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "gmaps_proxy #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

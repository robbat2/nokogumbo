require 'rubygems/package_task'
require 'rake/clean'
require 'rake/extensiontask'

task 'default' => 'test'

file 'lib/nokogumbo.rb' do
  mkdir_p 'lib'
  cp 'nokogumbo.rb', 'lib'
end

EXT = ['ext/nokogumboc/extconf.rb', 'ext/nokogumboc/nokogumbo.c']
task 'compile' => EXT

EXT.each do |ext|
  file ext => File.basename(ext) do
    mkdir_p File.dirname(ext)
    cp File.basename(ext), File.dirname(ext)
  end
end

file 'gumbo-parser' do
  sh 'git clone https://github.com/google/gumbo-parser.git'
end

task 'pull' => 'gumbo-parser' do
  Dir.chdir('gumbo-parser') do
    sh 'git pull'
  end
end

task 'test' => ['compile', 'lib/nokogumbo.rb'] do
  ruby 'test-nokogumbo.rb'
end

CLEAN.include FileList.new('ext', 'lib').existing
CLOBBER.include FileList.new('gumbo-parser', 'Gemfile.lock').existing

task 'package-ext' => EXT + ['gumbo-parser'] do
  sources = EXT + FileList['gumbo-parser/src/*']
  SPEC.files += sources
  PKG.package_files += sources
end

task 'gem' => ['test', 'package-ext']
SPEC = Gem::Specification.new do |gem|
  gem.name = 'nokogumbo'
  gem.version = '0.9'
  gem.email = 'rubys@intertwingly.net'
  gem.homepage = 'https://github.com/rubys/nokogumbo/#readme'
  gem.summary = 'Nokogiri interface to the Gumbo HTML5 parser'
  gem.extensions = 'ext/nokogumboc/extconf.rb'
  gem.author = 'Sam Ruby'
  gem.add_dependency 'nokogiri'
  gem.license = 'Apache 2.0'
  gem.description = %q(
    Nokogumbo allows a Ruby program to invoke the Gumbo HTML5 parser and
    access the result as a Nokogiri parsed document.).strip.gsub(/\s+/, ' ')
  gem.files = FileList[
    'lib/nokogumbo.rb',
    'LICENSE.txt',
    'README.md',
  ]
end

PKG = Gem::PackageTask.new(SPEC) do |pkg|
  pkg.need_tar = true
  pkg.need_zip = true
end

Rake::ExtensionTask.new('nokogumboc')

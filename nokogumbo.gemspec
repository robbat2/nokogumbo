SOURCES = ['ext/nokogumboc/extconf.rb', 'ext/nokogumboc/nokogumbo.c']
Gem::Specification.new do |gem|
  gem.name = 'nokogumbo'
  gem.version = '1.4.13'
  gem.email = 'rubys@intertwingly.net'
  gem.homepage = 'https://github.com/rubys/nokogumbo/#readme'
  gem.summary = 'Nokogiri interface to the Gumbo HTML5 parser'
  gem.extensions = 'ext/nokogumboc/extconf.rb'
  gem.author = 'Sam Ruby'
  gem.add_dependency 'nokogiri'
  gem.license = 'Apache-2.0'
  gem.description = %q(
    Nokogumbo allows a Ruby program to invoke the Gumbo HTML5 parser and
    access the result as a Nokogiri parsed document.).strip.gsub(/\s+/, ' ')
  gem.files = SOURCES + [
    'lib/nokogumbo.rb',
    'LICENSE.txt',
    'README.md',
    'gumbo-parser/src/*',
    'gumbo-parser/visualc/include/*',
    'test-nokogumbo.rb'
  ]
end

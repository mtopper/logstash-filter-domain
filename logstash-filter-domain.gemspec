Gem::Specification.new do |s|
  s.name = 'logstash-filter-domain'
  s.version         = '0.0.1'
  s.licenses = ['Apache License (2.0)']
  s.summary = "This filter returns the domain part of a host, so www.google.com -> google.com; download.windows.microsoft.com -> microsoft.com"
  s.description     = "This gem is a Logstash plugin required to be installed on top of the Logstash core pipeline using $LS_HOME/bin/logstash-plugin install gemname. This gem is not a stand-alone program"
  s.authors = ["Matt Topper"]
  s.email = 'topperm9@gmail.com'
  s.homepage = "http://www.elastic.co/guide/en/logstash/current/index.html"
  s.require_paths = ["lib"]

  # Files
  s.files = Dir['lib/**/*','spec/**/*','vendor/**/*','*.gemspec','*.md','Gemfile','LICENSE','NOTICE.TXT']
   # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "filter" }

  # Gem dependencies
  s.add_runtime_dependency "logstash-core-plugin-api", "~> 1.0"
  s.add_development_dependency "public_suffix", "1.4.6"
  s.add_development_dependency 'logstash-devutils'
end

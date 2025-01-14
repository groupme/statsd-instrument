Gem::Specification.new do |s|
  s.name        = "statsd-instrument"
  s.version     = '1.0.1'
  s.authors     = ["Jesse Storimer"]
  s.email       = ["jesse@shopify.com"]
  s.homepage    = "http://github.com/shopify/statsd-instrument"

  s.summary     = %q{A StatsD client for Ruby apps}
  s.description = %q{A StatsD client for Ruby apps. Provides metaprogramming methods to inject StatsD instrumentation into your code.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.add_development_dependency 'mocha'
  s.add_development_dependency 'eventmachine', '1.0.0.beta.3'
end

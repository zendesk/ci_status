Gem::Specification.new "ci_status", "0.1.0" do |s|
  s.summary     = "CI status interface"
  s.description = "Library for reading, parsing and presenting cruise control style build status pages (think CCMenu, CCTray)"
  s.authors     = [ "Morten Primdahl" ]
  s.email       = "primdahl@me.com"
  s.homepage    = "http://github.com/morten/ci_status"

  s.add_runtime_dependency("nokogiri", "~> 1.5")

  s.add_development_dependency("rake")
  s.add_development_dependency("bundler")
  s.add_development_dependency("minitest")
  s.add_development_dependency("webmock")

  s.files = `git ls-files`.split("\n")
  s.license = "MIT"
end

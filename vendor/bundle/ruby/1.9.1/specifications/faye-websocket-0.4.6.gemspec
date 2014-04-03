# -*- encoding: utf-8 -*-
# stub: faye-websocket 0.4.6 ruby lib
# stub: ext/faye_websocket_mask/extconf.rb

Gem::Specification.new do |s|
  s.name = "faye-websocket"
  s.version = "0.4.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["James Coglan"]
  s.date = "2012-07-09"
  s.email = "jcoglan@gmail.com"
  s.extensions = ["ext/faye_websocket_mask/extconf.rb"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc", "ext/faye_websocket_mask/extconf.rb"]
  s.homepage = "http://github.com/faye/faye-websocket-ruby"
  s.rdoc_options = ["--main", "README.rdoc"]
  s.rubygems_version = "2.2.2"
  s.summary = "Standards-compliant WebSocket server and client"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<eventmachine>, [">= 0.12.0"])
      s.add_development_dependency(%q<rack>, [">= 0"])
      s.add_development_dependency(%q<rake-compiler>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_development_dependency(%q<rainbows>, [">= 1.0.0"])
      s.add_development_dependency(%q<thin>, [">= 1.2.0"])
    else
      s.add_dependency(%q<eventmachine>, [">= 0.12.0"])
      s.add_dependency(%q<rack>, [">= 0"])
      s.add_dependency(%q<rake-compiler>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_dependency(%q<rainbows>, [">= 1.0.0"])
      s.add_dependency(%q<thin>, [">= 1.2.0"])
    end
  else
    s.add_dependency(%q<eventmachine>, [">= 0.12.0"])
    s.add_dependency(%q<rack>, [">= 0"])
    s.add_dependency(%q<rake-compiler>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.8.0"])
    s.add_dependency(%q<rainbows>, [">= 1.0.0"])
    s.add_dependency(%q<thin>, [">= 1.2.0"])
  end
end

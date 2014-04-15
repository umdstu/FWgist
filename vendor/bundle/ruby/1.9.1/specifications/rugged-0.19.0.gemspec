# -*- encoding: utf-8 -*-
# stub: rugged 0.19.0 ruby lib
# stub: ext/rugged/extconf.rb

Gem::Specification.new do |s|
  s.name = "rugged"
  s.version = "0.19.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Scott Chacon", "Vicent Marti"]
  s.date = "2013-07-10"
  s.description = "Rugged is a Ruby bindings to the libgit2 linkable C Git library. This is\nfor testing and using the libgit2 library in a language that is awesome.\n"
  s.email = "schacon@gmail.com"
  s.extensions = ["ext/rugged/extconf.rb"]
  s.files = ["ext/rugged/extconf.rb"]
  s.homepage = "http://github.com/libgit2/rugged"
  s.rubygems_version = "2.2.2"
  s.summary = "Rugged is a Ruby binding to the libgit2 linkable library"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake-compiler>, [">= 0"])
      s.add_development_dependency(%q<minitest>, ["~> 3.0.0"])
    else
      s.add_dependency(%q<rake-compiler>, [">= 0"])
      s.add_dependency(%q<minitest>, ["~> 3.0.0"])
    end
  else
    s.add_dependency(%q<rake-compiler>, [">= 0"])
    s.add_dependency(%q<minitest>, ["~> 3.0.0"])
  end
end

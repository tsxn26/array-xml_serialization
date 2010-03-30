# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{array-xml_serialization}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Thomas Nguyen"]
  s.date = %q{2010-03-30}
  s.description = %q{Forces elements in arrays to be output using to_xml on each element if the element responds to to_xml.  If an element does not respond to to_xml then a nested XML tag is created with the element's to_s value and the singlarized name of the array as the tag name.}
  s.email = %q{tsxn26@gmail.com}
  s.extra_rdoc_files = ["README.rdoc", "lib/array-xml_serialization.rb"]
  s.files = ["README.rdoc", "Rakefile", "lib/array-xml_serialization.rb", "Manifest", "array-xml_serialization.gemspec"]
  s.homepage = %q{http://github.com/tsxn26/array-xml_serialization}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Array-xml_serialization", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{array-xml_serialization}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Forces elements in arrays to be output using to_xml on each element if the element responds to to_xml.  If an element does not respond to to_xml then a nested XML tag is created with the element's to_s value and the singlarized name of the array as the tag name.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

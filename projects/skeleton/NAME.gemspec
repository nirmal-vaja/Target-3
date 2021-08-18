# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
    spec.name = "NAME"
    spec.version = '1.0'
    spec.authors = ["Nirmal Vaja"]
    spec.email = ["nirmalvaja123@gmail.com"]
    spec.summary = %q{Short summary of my project}
    spec.description = %{Long Description of my project}
    spec.homepage = "https://domainforproject.com"
    spec.licence = "MIT"
    spec.files = ['lib/name.rb']
    spec.executables = ['bin/NAME']
    spec.test_files = ['tests/test_NAME.rb']
    spec.require_paths = ["lib"]
end

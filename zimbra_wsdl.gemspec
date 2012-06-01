# -*- encoding: utf-8 -*-
require File.expand_path('../lib/zimbra_wsdl/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jorge Calás Lozano"]
  gem.email         = ["calas@qvitta.net"]
  gem.description   = %q{WSDL document for the VMware Zimbra soap api}
  gem.summary       = %q{WSDL document for the VMware Zimbra soap api}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "zimbra_wsdl"
  gem.require_paths = ["lib"]
  gem.version       = ZimbraWsdl::VERSION

  gem.add_development_dependency('minitest')
end

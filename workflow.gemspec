require_relative 'lib/workflow/version'

Gem::Specification.new do |gem|
  gem.name          = "workflow"
  gem.version       = Workflow::VERSION
  gem.authors       = ["Vladimir Dobriakov"]
  gem.email         = ["vladimir@geekq.net"]
  gem.description   = <<~DESC
                        Workflow is a finite-state-machine-inspired API for modeling and
                        interacting with what we tend to refer to as 'workflow'.

                        * nice DSL to describe your states, events and transitions
                        * various hooks for single transitions, entering state etc.
                        * convenient access to the workflow specification: list states, possible events
                        for particular state
                      DESC
  gem.summary       = %q{A replacement for acts_as_state_machine.}
  gem.licenses      = ['MIT']
  gem.homepage      = "https://github.com/geekq/workflow"

  gem.metadata["homepage_uri"] = gem.homepage
  gem.metadata["source_code_uri"] = gem.homepage
  gem.metadata["changelog_uri"] = "https://github.com/geekq/workflow/blob/develop/CHANGELOG.md"

  gem.files         = Dir['CHANGELOG.md', 'README.md', 'LICENSE', 'lib/**/*']
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.extra_rdoc_files = [
    "README.adoc"
  ]

  gem.required_ruby_version = '>= 2.7'
  gem.add_development_dependency 'rdoc',          '~> 6.4'
  gem.add_development_dependency 'bundler',       '~> 2.3'
  gem.add_development_dependency 'mocha',         '~> 2.2'
  gem.add_development_dependency 'rake',          '~> 13.1'
  gem.add_development_dependency 'minitest',      '~> 5.21'
  gem.add_development_dependency 'ruby-graphviz', '~> 1.2'

end


# frozen_string_literal: true

require_relative "lib/pg_like/version"

Gem::Specification.new do |spec|
  spec.name = "pg_like"
  spec.version = PgLike::VERSION
  spec.authors = ["Lapps Dev", "Victor Matheus"]
  spec.email = ["contato@lapps.dev", "imatheusfsantos@gmail.com"]

  spec.summary = "LIKE ANY and LIKE ALL PostgreSQL operators with Rails"
  spec.description = "A gem to facilitate the use of LIKE ANY and LIKE ALL PostgreSQL operators with Rails ActiveRecord"
  spec.homepage = "https://github.com/lappsdev/pg_like"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.0.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/lappsdev/pg_like"
  spec.metadata["changelog_uri"] = "https://github.com/lappsdev/pg_like/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "activerecord", ">= 5.2", "< 8.0"
  spec.add_dependency "pg", ">= 0.19", "< 2"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "database_cleaner", "~> 1.5"
  spec.add_development_dependency "with_model", "~> 2.0"
  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end

# frozen_string_literal: true

require_relative "lib/tiny_factory/version"

Gem::Specification.new do |spec|
  spec.name = "tiny_factory"
  spec.version = TinyFactory::VERSION
  spec.authors = ["Alexandre Ruban"]
  spec.email = ["alexandre@hey.com"]

  spec.summary = "Learn how to create gems by rebuilding FactoryBot"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end

  spec.add_dependency "activerecord", ">= 6.0.0"
end

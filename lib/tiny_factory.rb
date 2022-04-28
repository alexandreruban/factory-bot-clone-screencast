# frozen_string_literal: true

require "tiny_factory/syntax/methods"
require "tiny_factory/strategy/attributes_for"
require "tiny_factory/strategy/build"
require "tiny_factory/strategy/create"
require "tiny_factory/attribute"
require "tiny_factory/factory"

module TinyFactory
  @factories = []

  def self.factories
    @factories
  end

  def self.register_factory(factory)
    factories << factory
  end

  def self.define(name, &block)
    factory = Factory.new(name)
    factory.instance_eval(&block)
    register_factory(factory)
    factory
  end

  def self.attributes_for(name)
    find_factory(name).run(Strategy::AttributesFor)
  end

  def self.build(name)
    find_factory(name).run(Strategy::Build)
  end

  def self.create(name)
    find_factory(name).run(Strategy::Create)
  end

  def self.find_factory(name)
    factories.find { |factory| factory.name == name }
  end
end

# frozen_string_literal: true

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
end

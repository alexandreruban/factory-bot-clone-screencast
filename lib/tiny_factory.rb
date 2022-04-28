# frozen_string_literal: true

require "tiny_factory/attribute"
require "tiny_factory/factory"

module TinyFactory
  def self.define(name, &block)
    factory = Factory.new(name)
    factory.instance_eval(&block)
    factory
  end
end

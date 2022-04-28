module TinyFactory
  class Factory
    attr_reader :name, :attributes

    def initialize(name)
      @name = name
      @attributes = []
    end

    def run(strategy_class)
      strategy = strategy_class.new
      attributes.each { |attribute| attribute.add_to(strategy) }
      strategy.result
    end

    def method_missing(name, &block)
      attributes << Attribute.new(name, block)
    end
  end
end

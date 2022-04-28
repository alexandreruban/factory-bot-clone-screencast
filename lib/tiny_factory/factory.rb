module TinyFactory
  class Factory
    attr_reader :name, :attributes

    def initialize(name)
      @name = name
      @attributes = []
    end

    def run(strategy_class)
      strategy = strategy_class.new(build_class)
      attributes.each { |attribute| attribute.add_to(strategy) }
      strategy.result
    end

    def method_missing(name, &block)
      attributes << Attribute.new(name, block)
    end

    private

    def build_class
      name.to_s.classify.constantize
    end
  end
end

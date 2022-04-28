module TinyFactory
  class Factory
    attr_reader :name, :attributes

    def initialize(name)
      @name = name
      @attributes = []
    end

    def method_missing(name, &block)
      attributes << Attribute.new(name, block)
    end
  end
end

module TinyFactory
  class Attribute
    attr_reader :name, :definition

    def initialize(name, definition)
      @name = name.to_sym
      @definition = definition
    end
  end
end

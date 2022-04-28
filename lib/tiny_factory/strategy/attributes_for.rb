module TinyFactory
  module Strategy
    class AttributesFor
      def initialize
        @result = {}
      end

      def get(attribute)
        @result[attribute]
      end

      def set(attribute, value)
        @result[attribute] = value
      end

      def result
        @result
      end

      def method_missing(name)
        get(name)
      end
    end
  end
end

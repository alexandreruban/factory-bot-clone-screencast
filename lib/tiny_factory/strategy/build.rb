module TinyFactory
  module Strategy
    class Build
      def initialize(klass)
        @instance = klass.new
      end

      def get(attribute)
        @instance.send(attribute)
      end

      def set(attribute, value)
        @instance.send("#{attribute}=", value)
      end

      def result
        @instance
      end

      def method_missing(name)
        get(name)
      end
    end
  end
end

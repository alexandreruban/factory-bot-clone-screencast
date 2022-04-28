module TinyFactory
  module Strategy
    class Create < Build
      def result
        @instance.save!
        @instance
      end
    end
  end
end

# frozen_string_literal: true

module Hanami
  module CLI
    # @api private
    class MiddlewareStackInspector
      def initialize(stack:)
        @stack = stack
      end

      def inspect(include_arguments: false)
        max_path_length = @stack.map { |(path)| path.length }.max

        @stack.map do |path, middlewares|
          middlewares.map do |(middleware, arguments)|
            "#{path.ljust(max_path_length + 3)} #{format_middleware(middleware)}#{format_arguments(arguments) if include_arguments}"
          end
        end.join("\n") + "\n"
      end

      private

      def format_middleware(middleware)
        case middleware
        when Class
          middleware.name || "(class)"
        when Module
          middleware.name || "(module)"
        else
          "#{middleware.class.name} (instance)"
        end
      end

      def format_arguments(arguments)
        " args: #{arguments.inspect}"
      end
    end
  end
end
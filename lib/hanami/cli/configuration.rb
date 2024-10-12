# frozen_string_literal: true

module Hanami
  module CLI
    module Configuration
      def self.extended(base)
        base.module_eval do
          extend Dry::Configurable

          setting :template_dir, default: [__dir__, 'generators'].join('/')
        end
      end
    end
  end
end

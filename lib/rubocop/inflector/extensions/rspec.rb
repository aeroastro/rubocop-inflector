# frozen_string_literal: true

module RuboCop
  module Inflector
    module Extensions
      module RSpec # :nodoc: all
        # Provides a extension on rubocop-rspec
        module Cop
          module RSpec
            module FilePath
              def camel_to_snake_case(string)
                ActiveSupport::Inflector.underscore(string)
              end
            end

            module SpecFilePathFormat
              def camel_to_snake_case(string)
                ActiveSupport::Inflector.underscore(string)
              end
            end
          end
        end

        if const_defined? '::RuboCop::Cop::RSpec::FilePath'
          ::RuboCop::Cop::RSpec::FilePath.prepend Cop::RSpec::FilePath
        end
        if const_defined? '::RuboCop::Cop::RSpec::SpecFilePathFormat'
          ::RuboCop::Cop::RSpec::SpecFilePathFormat.prepend Cop::RSpec::SpecFilePathFormat
        end
      end
    end
  end
end

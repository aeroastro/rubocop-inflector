# frozen_string_literal: true

RSpec.describe RuboCop::Inflector::Extensions::RSpec do
  if const_defined? 'RuboCop::Cop::RSpec::FilePath'
    describe RuboCop::Cop::RSpec::FilePath, :config do
      subject(:cop) { described_class.new(config) }

      context 'without ActiveSupport::Inflector config' do
        it 'registers an offense for a bad path' do
          expect_offense(<<~RUBY, 'wrong_path_foo_spec.rb')
            describe MyClass, 'foo' do; end
            ^^^^^^^^^^^^^^^^^^^^^^^ Spec path should end with `my_class*foo*_spec.rb`.
          RUBY
        end

        it 'checks class specs' do
          expect_no_offenses(<<~RUBY, 'some/class_spec.rb')
            describe Some::Class do; end
          RUBY
        end
      end

      context 'with ActiveSupport::Inflector config' do
        before do
          ActiveSupport::Inflector.inflections(:en) do |inflect|
            inflect.acronym 'PvP'
          end
        end

        it 'checks class specs with registered acronym' do
          expect_no_offenses(<<~RUBY, 'pvp/pvp_battles_controller_spec.rb')
            describe PvP::PvPBattlesController do; end
          RUBY
        end
      end
    end
  end

  if const_defined? 'RuboCop::Cop::RSpec::SpecFilePathFormat'
    describe RuboCop::Cop::RSpec::SpecFilePathFormat, :config do
      subject(:cop) { described_class.new(config) }

      context 'without ActiveSupport::Inflector config' do
        it 'registers an offense for a bad path' do
          expect_offense(<<~RUBY, 'wrong_path_foo_spec.rb')
            describe MyClass, 'foo' do; end
            ^^^^^^^^^^^^^^^^^^^^^^^ Spec path should end with `my_class*foo*_spec.rb`.
          RUBY
        end

        it 'checks class specs' do
          expect_no_offenses(<<~RUBY, 'some/class_spec.rb')
            describe Some::Class do; end
          RUBY
        end
      end

      context 'with ActiveSupport::Inflector config' do
        before do
          ActiveSupport::Inflector.inflections(:en) do |inflect|
            inflect.acronym 'PvP'
          end
        end

        it 'checks class specs with registered acronym' do
          expect_no_offenses(<<~RUBY, 'pvp/pvp_battles_controller_spec.rb')
            describe PvP::PvPBattlesController do; end
          RUBY
        end
      end
    end
  end
end

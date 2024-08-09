# frozen_string_literal: true

require 'spec_helper'

RSpec.describe RuboCop::Inflector::Extensions::RSpec do
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

    it 'checks class specs without inflections' do
      expect_offense(<<~RUBY, 'pvp/pvp_battles_controller_spec.rb')
        describe PvP::PvPBattlesController do; end
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Spec path should end with `pv_p/pv_p_battles_controller*_spec.rb`.
      RUBY
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

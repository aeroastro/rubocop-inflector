# frozen_string_literal: true

require 'active_support/inflector'

require 'rubocop'

require_relative 'rubocop/inflector'
require_relative 'rubocop/inflector/version'

require 'rubocop/inflector/extensions/rspec' if defined? RuboCop::RSpec

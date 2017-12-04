require 'active_support'
require 'active_support/core_ext'

# Bootstrap Helpers
module Bh4
  mattr_accessor :framework
end

# Always require every generic helper
helpers_folder = File.expand_path '../bh4/helpers/*_helper.rb', __FILE__
Dir[helpers_folder].each{|file| require file}

# Conditionally require platform-specific helpers
extension   = :railtie if defined?(Rails)
extension ||= :middleman if defined?(Middleman)
extension ||= :padrino if defined?(Padrino)
require "bh4/core_ext/#{extension}" if extension

require 'bh4/core_ext/rails/form_for_helper'

module Bh4
  module Extensions
    # Makes Bootstrap helpers available in Rails applications.
    #
    # To use Bh in a Rails app you need 1 step:
    #
    #   - include bh4.in the Gemfile
    #
    # The current class is loaded during the initialization process, so
    # there is no need to manually require any other file.
    class Railtie < ::Rails::Railtie
      initializer 'bh4.add_helpers' do
        ActionView::Base.send :include, Bh4::Helpers
        ActionView::Base.send :include, Bh4::Rails::Helpers
      end

      initializer 'bh4.add_views' do |app|
        views_path = File.expand_path '../../views', __FILE__
        ActionController::Base.prepend_view_path views_path
      end
    end
  end

  Bh4.framework = :rails
end

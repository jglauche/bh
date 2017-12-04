require 'bh4/classes/base'

module Bh4
  module Classes
    class PanelRow < Base
      # @return [#to_s] the grid-related class to assign to each panel
      #   nested in this panel row.
      def column_class
        @options[:column_class]
      end
    end
  end
end
require 'bh4/helpers/panel_helper'

module Bh4
  module Form
    module FieldsetHelper
      include BaseHelper
      include Bh4::Helpers # for panel

      def fieldset(title = nil, &block)
        options = {tag: :fieldset, body: @template.capture(&block)}
        options[:heading] = title if title.present? && !inline_form?
        panel options
      end
    end
  end
end
RSpec::Matchers.define :generate do |html|
  match do |helper, options = nil|
    if helper.is_a?(Hash)
      helper, options = helper.keys.first, helper.values.first
    end

    if helper == :link_to && options == :nil_name
      @inline = bh4.send helper, nil, '/'
      @block = @inline
    elsif helper == :link_to && options == :xss_script
      @inline = bh4.send helper, '<script>alert("xss")</script>', '/'
      @block = bh4.send(helper, '/') { '<script>alert("xss")</script>' }
    elsif helper == :link_to && options == :safe_html
      @inline = bh4.send helper, bh4.tag(:hr), '/'
      @block = bh4.send(helper, '/') { bh4.tag(:hr) }
    elsif helper == :link_to || helper == :button_to
      @inline = bh4.send helper, *['content', '/', options].compact
      if bh4.test_button_to_with_block
        @block = bh4.send(helper, *['/', options].compact) { 'content' }
      else
        @block = @inline
      end
    elsif helper == :dropdown
      @block = bh4.send(helper, *['caption', options].compact) { 'content' }
      @inline = @block
    elsif helper == :glyphicon || helper == :icon
      @inline = bh4.send helper, *['zoom-in', options].compact
      @block = bh4.send helper, *[:zoom_in, options].compact
    elsif helper == :progress_bar
      @inline = bh4.send helper, *Array.wrap(options)
      @block = @inline
    elsif helper == :navbar || helper == :nav || helper == :panel_row
      @block = bh4.send(helper, *[options].compact) { 'content' }
      @inline = @block
    else
      @inline = bh4.send helper, *['content', options].compact
      @block = bh4.send(helper, *[options].compact) { 'content' }
    end

    case html
      when Regexp then @inline.match(html) && @block.match(html)
      else @inline.eql?(html) && @block.eql?(html)
    end
  end

  failure_message{|actual| "expected #{html}, got #{@inline} and #{@block}"}
end
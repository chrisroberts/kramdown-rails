require 'kramdown'

module Kramdown
  module Converter
    class Html

      include ActionView::Helpers::AssetTagHelper

      def convert_img(element, indent)
        attributes = element.attr.dup
        link = attributes.delete('src')
        image_tag(
          ActionController::Base.helpers.asset_path(link),
          attributes
        )
      end

    end
  end
end

module KramdownRails
  module TemplateHandler
    class << self

      def erb
        Thread.current[:erb_template] ||= ActionView::Template.registered_template_handler(:erb)
      end

      def call(template, source)
        compiled_template = erb.call(template, source)
        "Kramdown::Document.new(begin;#{compiled_template};end).to_html.html_safe"
      end

    end
  end
end

class String
  def md_to_html
    Kramdown::Document.new(self).to_html.html_safe
  end
  alias_method :markdown_to_html, :md_to_html
end

ActionView::Template.register_template_handler :md, KramdownRails::TemplateHandler
ActionView::Template.register_template_handler :markdown, KramdownRails::TemplateHandler

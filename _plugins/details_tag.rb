# _plugins/details_tag.rb
# from http://movb.de/jekyll-details-support.html

module Jekyll
  module Tags
    class DetailsTag < Liquid::Block

      def initialize(tag_name, markup, tokens)
        super
        @caption = markup
      end

      def render(context)
        site = context.registers[:site]
        # as of Jekyll 3.x use this:
        # converter = site.find_converter_instance(::Jekyll::Converters::Markdown)
        converter = site.getConverterImpl(::Jekyll::Converters::Markdown)
        caption = converter.convert(@caption)
        body = converter.convert(super(context))
        "<details><summary>#{caption}</summary>#{body}</details>"
      end

    end
  end
end

Liquid::Template.register_tag('details', Jekyll::Tags::DetailsTag)

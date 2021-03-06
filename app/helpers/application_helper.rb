# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
require 'string'
  def show_locale_files
    output = ''
    Dir["#{LOCALES_DIRECTORY}#{I18n.locale}.{rb,yml}"].sort.each do |locale_file|
      output << "\n#{locale_file.sub(RAILS_ROOT + "/", "")}:\n\n"
      counter, lineWidth = 1, 80
      lines = *open(locale_file).map(&:rstrip).each do |line|
        output << "#{sprintf('%3d', counter)}: #{line}\n"
        counter += 1
      end
    end
    output
  end
  # content side bar
  def content(size, &block)
    @size = size.to_s and yield
  end

  def sidebar(&block)
    content_for(:sidebar, content_tag(:div, capture(&block), :id => 'sideview'))
  end



def text_field_for(form, field,
                     size=HTML_TEXT_FIELD_SIZE,
                     maxlength=DB_STRING_MAX_LENGTH)
    label = content_tag("label", "#{field.humanize}:", :for => field)
    form_field = form.text_field field, :size => size, :maxlength => maxlength
   # content_tag("div", "#{label} #{form_field}", :class => "form_row")
  end





end


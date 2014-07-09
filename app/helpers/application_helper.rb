# encoding: utf-8
module ApplicationHelper

  def show_paginate
    if @page_info
      content_tag(:div, :class => 'page', :id => 'page') do
        output = ""
        if @page_info[:current] == 1
          output +=content_tag(:span, :class => "page_first_no") {}
          output +=content_tag(:span, :class => "page_prev_no") {}
        else
          output +=content_tag(:span, :class => "page_first") {}
          output +=content_tag(:span, :class => "page_prev") {}
        end
        output +=content_tag(:span, :class => "page_text") {
          text_field_tag("paginate", @page_info[:current], :class => "input_page", :id => "paginate")
        }
        output +=content_tag(:span, :class => "") {
          "/ " + @page_info[:count].to_s
        }
        output +=content_tag(:span, :class => "page_go") {}
        if @page_info[:current] == @page_info[:count]
          output +=content_tag(:span, :class => "page_next_no") {}
          output +=content_tag(:span, :class => "page_last_no") {}
        else
          output +=content_tag(:span, :class => "page_next") {}
          output +=content_tag(:span, :class => "page_last") {}
        end
        output.html_safe
      end
    end
  end

  def title_bar
    content_tag(:div,:class=> "title_bar") do
      output = ""
      output += content_tag(:span,:class => ""){image_tag("right01.gif")}+
      content_tag(:span){@title}
      output.html_safe
    end

  end

  def format_datetime datetime
    datetime.strftime "%Y-%m-%d %H:%M:%S" if datetime
  end

  def list_index
    @list_index ||= 0
    @page_info ? (@page_info[:offset] + @list_index += 1) : @list_index += 1
  end
end

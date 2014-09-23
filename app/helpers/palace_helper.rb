#encoding:utf-8
module PalaceHelper
  def palace_calendar start_date, end_date, url_options, html_options, need_bgcolor
    @url_options = url_options
    @html_options = html_options
    @need_bgcolor = need_bgcolor
    if start_date && end_date
      row = nil
      start = start_date
      while start <= end_date
        if row.nil?
          row = Array.new 7
          @palace_rows << row
        end
        index = (start.wday + 6) % 7
        row[index] = start
        row = nil if index == 6
        start = start.succ
      end
    end
  end

end
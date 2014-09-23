#encoding:utf-8
class PalaceController < ApplicationController
  def index
    now = Time.now
    @start_date = now.beginning_of_month.mday.to_i
    @end_date = now.end_of_month.mday.to_i
    @need_bgcolor = true
  end

end
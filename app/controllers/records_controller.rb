#encoding:utf-8
class RecordsController < ApplicationController
  def index
    @title = "当前位置 考勤记录"
    @records = Record.all
  end

  def show
    @record = Record.find(params[:id])
  end

  def new

  end

  def edit
    @record = Record.find(params[:id])
  end

  def create
    @record = Record.new
    @record.terminal_id = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip
    @record.in_out = 1
    @record.created_at = DateTime.current
    @record.card = current_user.card
    @record = Record.new(params[:record])
  end

  def update
    @record = Record.find(params[:id])
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
  end
end

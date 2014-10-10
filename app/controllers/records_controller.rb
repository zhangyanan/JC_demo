#encoding:utf-8
class RecordsController < ApplicationController

  INOUTSTATES = ["上班",1],["下班",2]
  WORKSTATES = ["正常",1],["迟到",2]

  def index
    @in_out = INOUTSTATES
    @work_states = WORKSTATES
    @title = "当前位置 考勤记录"
    @record = Record.new
    @records = set_paginate Record.order("created_at")
  end

  def show
    @record = Record.find(params[:id])
  end

  def new
    Record.transaction do
      @record = Record.new
      @record.terminal = Terminal.find_by_remote_id request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip
      @record.in_out = 1
      @record.created_at = DateTime.current
      @record.card = current_user.card
      @record.save
    end
    redirect_to :action => :index
  end

  def edit
    @record = Record.find(params[:id])
  end

  def create
    Record.transaction do
      @record = Record.new
      @record.terminal_id = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip
      @record.in_out = 1
      @record.created_at = DateTime.current
      @record.card = current_user.card
      @record.save
    end
  end

  def update
    @record = Record.find(params[:id])
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
  end

  def query
    @title = "当前位置 考勤记录检索"
    @record = Record.new
    @records = Record
    @in_out = INOUTSTATES
    @work_states = WORKSTATES
    unless params["employee"]["id"].blank?
      @employee = Employee.find(params["employee"]["id"])
      @records = @employee.card.records
    end
    unless params["card"]["id"].blank?
      @card = Card.find(params["card"]["id"])
      @records = @card.records
    end
    unless params["terminal"]["id"].blank?
      @terminal = Terminal.find(params["terminal"]["id"])
      @records = @terminal.records
    end
    unless params["record"]["in_out"].blank?
      @records = @records.find_all_by_in_out(params["record"]["in_out"])
    end
    @date = params["record"]["created_at"].to_datetime
    p "----"
    p params[:created_at]
    unless params["work"]["state"].blank?
      case params["work"]["state"]
        when 1
          @records = @records.where("created_at < ?",DateTime.new(@date.year, @date.month, @date.day, 8, 30, 0))
        when 2
          @records = @records.where("created_at > ? and < ?",DateTime.new(@date.year, @date.month, @date.day, 8, 30, 0),DateTime.new(@date.year, @date.month, @date.day, 17, 30, 0))
      end
    end
    @records = set_paginate @records
    render :action => :index
  end
end

#encoding:utf-8
class RecordsController < ApplicationController
  INOUT = [["上班",1],["下班",2]]
  WORKSTATES = [["正常",1],["迟到",2],["请假",3],["公出",4]]

  def index
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
    p params[:employee_id]
    if params[:employee_id]
      @records = @records.join(:card).where("cards.employee_id = ?",params[:employee_id])
    end
    if param[:card_id]

    end
    if params[:terminal_id]

    end
    if params[:in_out_state]

    end
    if params[:work_state]

    end
    render :action => :index
  end
end

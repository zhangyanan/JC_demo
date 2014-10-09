#encoding:utf-8
class RecordsController < ApplicationController
  def index
    @title = "当前位置 考勤记录"
    @record = Record.new
    @work_states = [["上班",1],["下班",2]]
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
    p "1111111111111"
    @records = Record
    if params[:name]
      p params[:name]
      #@records = @records.where("")
    end
  end
end

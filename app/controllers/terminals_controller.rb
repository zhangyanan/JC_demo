#encoding:utf-8
class TerminalsController < ApplicationController
  def index
    @title = "当前位置 终端列表"
    @terminals = Terminal.all
  end

  def new
    @title = "当前位置 新建终端"
    @terminal = Terminal.new
  end

  def edit
    @title = "当前位置 编辑终端"
    @terminal = Terminal.find(params[:id])
  end

  def create
    @terminal = Terminal.new(params[:terminal])
    @terminal.save
    redirect_to :action => :index
  end

  def update
    Terminal.transaction do
      @terminal = Terminal.find(params[:id])
      @terminal.update_attributes(params[:@terminal])
      @terminal.save
      redirect_to :action => :index
    end
  end

  def delete
    @terminal = Terminal.find(params[:id])
    @terminal.destroy
    redirect_to :action => :index
  end

  def query
    @title = "当前位置 终端搜索"
    @terminals = Terminal.where("name like ?","%#{params[:name]}%")
    render :action => :index
  end
end

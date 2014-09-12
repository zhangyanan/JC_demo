#encoding:utf-8
class MenuController < ApplicationController
  def index
    @title = "当前位置 菜单列表"
    @menus = set_paginate Menu.order("id ASC")
  end

  def edit
    @menu = Menu.find(params[:id])
    @parent_menus = Menu.root_menu
    @rights = Right.all_names
  end

  def update
    @menu = Menu.find params[:id]
    if @menu.update_attributes(params[:menu])
      redirect_to :index
    else
      flash[:message] = "无法保存"
      redirect_to :action => :edit, :id => params[:id]
    end
  end

  def enable
    simple_enable Menu
  end

  def disable
    simple_disable Menu
  end
end
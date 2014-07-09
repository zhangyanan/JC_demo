#encoding:utf-8
class RolesController < ApplicationController

  def index
    @title = "当前位置 角色列表"
    @roles = set_paginate Role.order("id ASC")
  end

  def new
    @title = "当前位置 新建角色"
    @role = Role.new
  end

  def edit
    @title = "当前位置 修改角色"
    @role = Role.find(params[:id])
  end

  def create
    @role = Role.new(params[:role])
    if @role.save
       redirect_to :action => :index
    else
       redirect_to :action => :new
    end
  end

  def update
    @role = Role.find(params[:id])
    if @role.update_attributes(params[:role])
      redirect_to :action => :index
    else
      redirect_to :action => :back
    end
  end

  def delete
    @role = Role.find(params[:id])
    #if @role.used?
    #  flash[:message] = "角色被使用，不能删除!"
    #else
      @role.destroy
      flash[:message] = "删除成功!"
    #
    #end
    redirect_to :action => :index
  end

  def enable
    Role.transaction do
      role = Role.find params[:id]
      role.update_attributes state: Role::ENABLED
    end
  end

  def disable
    Role.transaction do
      role = Role.find params[:id]
      role.update_attributes state: Role::DISABLED
    end
  end

end

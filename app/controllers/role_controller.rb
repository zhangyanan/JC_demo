#encoding:utf-8
class RoleController < ApplicationController
  include SimpleEnableDisable

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
    @rights = @role.rights
    p @rights
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
    role = Role.find(params[:id])
    if role.update_attributes(params[:role])
      #role.rights = params[:role][:rights]
      #role.save
    else
      redirect_to :action => :index
    end
  end

  def delete
    @role = Role.find(params[:id])
    if @role.used?
      flash[:message] = "角色被使用，不能删除!"
    else
      @role.destroy
      flash[:message] = "删除成功!"
    end
    redirect_to :action => :index
  end

  def enable
   simple_enable Role
  end

  def disable
   simple_disable Role
  end

  def query
    @title = "当前位置 角色搜索"
    if params[:name].blank?
      roles = set_paginate Role.where('1=2')
    else
      roles = Role.where('name like ?',"%#{params[:name]}%")
    end
    @roles = set_paginate roles
    render :action => :index
  end
end

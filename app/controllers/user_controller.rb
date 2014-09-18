#encoding:utf-8
class UserController < ApplicationController
  def index
    @title = "当前位置 用户列表"
    @users = set_paginate User.order("id ASC")
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @title = "当前位置 新建用户"
    @user = User.new
    render :action => :edit
  end

  def edit
    @title = "当前位置 修改用户"
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end

  def update
    @user = User.find(params[:id])
    User.transaction do
      if @user.update_attributes!(@user)
        redirect_to :action => :index
      else
        render :action => :edit
      end
    end
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :action => :index
  end

  def enable
   simple_enable User
  end

  def disable
   simple_disable User
  end

  def query
    @title = "当前位置 用户搜索"
    if params[:name].blank?
      users = set_paginate User.where('1=2')
    else
      users = User.where('name like ?',"%#{params[:name]}%")
    end
    p users
    @users = set_paginate users
    render :action => :index
  end
end

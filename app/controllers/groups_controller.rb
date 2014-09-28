#encoding:utf-8
class GroupsController < ApplicationController
  def index
    @title = "当前位置 组列表"
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @title = "当前位置 新建组"
    @group = Group.new
  end

  def edit
    @title = "当前位置 编辑组"
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(params[:group])
    @group.save
    redirect_to :action => :index
  end

  def update
    @group = Group.find(params[:id])
    @group.update_attributes(params[:group])
    @group.save
    redirect_to :action => :index
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to :action => :index
  end
end

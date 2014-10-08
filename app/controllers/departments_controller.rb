#encoding:utf-8
class DepartmentsController < ApplicationController
  def index
    @title = "当前位置 部门列表"
    @departments = Department.where("parent_id is not null")
  end

  def show
    @department = Department.find(params[:id])
  end

  def new
    @title = "当前位置 新建部门"
    @department = Department.new
  end

  def edit
    @title = "当前位置 编辑部门"
    @department = Department.find(params[:id])
  end

  def create
    @department = Department.new(params[:department])
    @department.state = CommonActiveRecord::ENABLED
    @department.save
    redirect_to :action => :index
  end

  def update
    @department = Department.find(params[:id])
    @department.update_attributes(params[:department])
    @department.save
    redirect_to :action => :index
  end

  def delete
    @department = Department.find(params[:id])
    if @department.has_children? && has_employees?
      flash[:notice] = "该部门有子部门！或该部门下有员工资料，不可删除"
    else
      @department.destroy
    end
    redirect_to :action => :index
  end

  def query
    @departments = set_paginate Department.where("name like ?","%#{params[:name]}%")
    render :action => :index
  end

  def disable
   Department.transaction do
      @department = Department.find params[:id]
      @department.state = CommonActiveRecord::DISABLED
      @department.save
      redirect_to :action => :index
    end
  end

  def enable
    Department.transaction do
      @department = Department.find params[:id]
      @department.state = CommonActiveRecord::ENABLED
      @department.save
      redirect_to :action => :index
    end
  end
end

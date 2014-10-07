#encoding:utf-8
class DepartmentsController < ApplicationController
  def index
    @title = "当前位置 部门列表"
    @departments = Department.all
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
    @department.destroy
    redirect_to :action => :index
  end

  def query
    @departments = set_paginate Department.where("name like ?","%#{params[:name]}%")
    render :action => :index
  end
end

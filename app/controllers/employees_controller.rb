#encoding:utf-8
class EmployeesController < ApplicationController
  STATES = [["在职",Employee::ONJOIB],["离职",Employee::OFFJOIB,2],["出差",Employee::AWAYJOIB,3],["产假",Employee::MATERNITYlEAVE,4],["陪产假",Employee::PATERNITYlEAVE,5]]
  def index
    @title = "当前位置 员工列表"
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end


  def new
    @title = "当前位置 新增员工资料"
    @states = STATES
    @employee = Employee.new
  end


  def edit
    @title = "当前位置 编辑员工资料"
    @states = STATES
    @employee = Employee.find(params[:id])
  end


  def create
    @employee = Employee.new(params[:employee])
    Employee.transaction do
      @employee.save
    end
    redirect_to :action => :index
  end


  def update
    @employee = Employee.find(params[:id])
    @employee.update_attributes(params[:employee])
    @employee.save
    redirect_to :action => :index
  end


  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
  end

  def query
    @employees = set_paginate Employee.where("name like ?","%#{params[:name]}%")
    render :action => :index
  end
end

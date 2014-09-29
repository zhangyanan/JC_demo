#encoding:utf-8
class EmployeesController < ApplicationController
  def index
    @title = "当前位置 员工列表"
    @employees = set_paginate Employee.order('name')
  end

  def show
    @employee = Employee.find(params[:id])
  end


  def new
    @title = "当前位置 新增员工"
    @states = [["在职",Employee::ONJOIB],["离职",Employee::OFFJOIB,2],["出差",Employee::AWAYJOIB,3],["产假",Employee::MATERNITYlEAVE,4],["陪产假",Employee::PATERNITYlEAVE,5]]
    @employee = Employee.new
  end


  def edit
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
  end


  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
  end
end

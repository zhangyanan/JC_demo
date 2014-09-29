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
    @employee = Employee.new
  end


  def edit
    @employee = Employee.find(params[:id])
  end


  def create
    @employee = Employee.new(params[:employee])
  end


  def update
    @employee = Employee.find(params[:id])
  end


  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
  end
end

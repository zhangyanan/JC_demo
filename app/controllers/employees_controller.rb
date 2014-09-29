#encoding:utf-8
class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
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

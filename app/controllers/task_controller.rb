#encoding:utf-8
class TaskController < ApplicationController
  def index
    @title = "任务管理 问题列表"
    if params[:id]
      @project = Project.find(params[:id])
    end
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @title = "当前位置 新建任务"
    @task = Task.new
    render :action => :edit
  end

  def edit
    @title = "当前位置 编辑任务"
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(params[:task])
    if @task.save
      redirect_to :action => :index
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:task])
    if @task && @task.update_attributes(params[:task])
      @task.save
      flash[:notice] = "任务更新完成"
    end
    redirect_to :action => :index
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
end

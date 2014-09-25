#encoding:utf-8
class TaskController < ApplicationController
  def index
    @title = "任务管理 问题列表"
    if params[:id]
      @project = Project.find(params[:id])
      @tasks = Task.where("project_id = ?",params[:id])
    else
      @tasks = Task.all
    end
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
    @task = Task.new(:project_id => params[:project_id])
  end

  def edit
    @title = "当前位置 编辑任务"
    @task = Task.find(params[:id])
  end

  def save
    @task = Task.new(params[:task])
    @task.state = CommonActiveRecord::ENABLED
    @task.creator = session[:user_id]
    if @task
      @task.save
      redirect_to :action => :index,:id => @task.project_id
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])
    if params[:task]
      @task.update_attributes(params[:task])
      @task.save
      flash[:notice] = "任务更新完成"
    end
    redirect_to :action => :index,:id => :params[:project_id]
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

  def query
    @title = "当前位置 任务搜索"
    @tasks = Task.where("name like ?","%#{params[:name]}%")
    render :action => :index
  end
end

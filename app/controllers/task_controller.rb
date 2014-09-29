#encoding:utf-8
class TaskController < ApplicationController
  def index
    @title = "任务管理 问题列表"
    @tasks = Task
    if params[:id]
      @project = Project.find(params[:id])
      @tasks = @tasks.where("project_id = ?", params[:id])
    end
    if params[:state]
      @tasks = @tasks.where("state = ?", params[:state])
    end
  end

  def show
    @task = Task.find(params[:id])
  end

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
      redirect_to :action => :index, :id => @task.project_id
    end
  end

  def update
    @task = Task.find(params[:id])
    if params[:task]
      @task.update_attributes(params[:task])
      @task.save
      flash[:notice] = "任务更新完成"
    end
    redirect_to :action => :index, :id => params[:task][:project_id]
  end

  def delete
    @task = Task.find params[:id]
    @task.state = CommonActiveRecord::DISABLED
    @task.save
    redirect_to :action => :index
  end

  def query
    @title = "当前位置 任务搜索"
    @tasks = Task.where("name like ?", "%#{params[:name]}%")
    render :action => :index
  end
end

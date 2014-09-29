#encoding:utf-8
class ProjectController < ApplicationController
  def index
    @projects = Project.includes(:user)
    if params[:group_id]
      @projects = @projects.where("group_id = ?", params[:group_id])
    end
    @title = "当前位置 项目列表"
    @groups = Group.all
  end


  def new
    @title = "当前位置 新建项目"
    @project = Project.new
  end

  def edit
    @title = "当前位置 编辑项目"
    @project = Project.find(params[:id])
  end


  def create
    @project = Project.new(params[:project])
    @project.creator = session[:user_id]
    @project.state = CommonActiveRecord::ENABLED
    @project.save
    redirect_to :action => :index
  end


  def update
    @project = Project.find(params[:id])
  end


  def delete
    @project = Project.find(params[:id])
    Project.transaction do
      @project.destroy
    end
    redirect_to :action => :index,:group_id => :params[:group_id]
  end

  def query
    @title = "当前位置 项目搜索"
    projects1 = Project.where("name like ?", "%#{params[:name].downcase}%")
    projects2 = Project.where("name like ?", "%#{params[:name].upcase}%")
    @projects = projects1 + projects2
    render :action => :index
  end

end

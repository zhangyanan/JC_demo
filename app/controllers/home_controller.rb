#encoding:utf-8
class HomeController < ApplicationController

  def index
    if current_user
      @menus = {}
      @parent_menus = Menu.where(:parent_menu_id => Menu.root.id)
      home
    else
      render :action => :home, :layout => 'login'
    end
  end

  def main

  end

  def logout
    reset_session
    redirect_to :action => :login
  end

  def login
    unless params[:name].blank? || params[:password].blank?
      if (user = User.find_by_name_and_password(params[:name], params[:password]))
        set_session_user user
      else
        flash[:name] = params[:name]
        flash[:u_error] = true
      end
    end
    redirect_to :action => :index
  end

  def home
    render :action => :index, :layout => "main"
  end

  private :home


end
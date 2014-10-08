#encoding:utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  #helper_method:让controller中的方法在view中可用
  helper_method :admin?,:current_user,:logged_in?,:current_role

  def current_user
    User.find session[:user_id] rescue nil
  end

  def current_card
    current_user.card
  end

  def logged_in?
    current_user != nil
  end

  def current_role
    current_user.roles.first.name
  end

  protected
  def admin?
    logged_in? && current_user.roles.collect{|role|role.id}.include?(Role.find(1).id)
  end

  def set_session_user user
    session[:user_id] = user.id
  end

  def action_params
    path = "#{controller_name}/#{params[:id]}/#{action_name}/"
    paths = session[:p]
    for p in paths
      return p[:v] if p[:p] == path
    end
    self.action_params = {}
  end

  def action_params= value
    path = "#{controller_name}/#{params[:id]}/#{action_name}/"
    paths = session[:p].delete_if { |p| p[:p] == path }
    paths << {:p => path, :v => value}
    session[:p] = paths.last(10)
    action_params
  end

  #paginate
  def set_paginate(collection_id,options = {})
    if collection_id.is_a?(Symbol)
        collection = collection.to_s.underscore
        model_name = collection.classify.constantize
    else
        model_name = collection_id
    end
    params.delete :form_authenticity_token
    records = model_name.paginate options.merge :page => params[:page] || 1
    @page_info = {:total => records.total_entries, :count => records.total_pages, :current => records.current_page.to_i, :offset => records.offset }
    show_info "共有#{@page_info[:total]}条记录"+ (@page_info[:total].zero? ? "" : ",当前显示第#{records.offset+1}条-第#{[records.offset + records.per_page,records.total_entries].min}条")
    if params[:page]
      self.action_params = self.action_params.merge! :page => params[:page]
    end
    records
  end

  def show_info msg
    flash[:info] = msg
  end

end

#encoding:utf-8
module SimpleEnableDisable
  private
  def simple_modify_state model,state
    params_name = model.model_name.underscore
    id = (params[params_name]) && params[params_name][:id] || params[:id]
    record = model.find id
    if record
      model.transaction do
        if record.state != state
          record.update_attributes! state: state
        end
      end
    end
  end

  def simple_enable model,success_action = nil
    simple_modify_state model,model::ENABLED
    redirect_to :action => success_action || :index
  end

  def simple_disable model,success_action = nil
    simple_modify_state model,model::DISABLED
    redirect_to :action => success_action || :index
  end
end
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from ActiveRecord::RecordNotFound, :with => :render_record_not_found
  rescue_from ActionController::RoutingError, :with => :render_record_not_found
  rescue_from ActionController::UnknownAction, :with => :render_record_not_found

  private 

  # Catch record not found for Active Record
  def render_record_not_found
    respond_to do |type| 
      type.html { render :template => "errors/404", :layout => 'application', :status => 404 } 
      type.all  { render :nothing => true, :status => 404 } 
    end
    true
  end

  def after_sign_in_path_for(resource)
    return request.env['omniauth.origin'] || stored_location_for(resource) || root_url
  end

  def after_sign_up_path_for(resource)
    return request.env['omniauth.origin'] || stored_location_for(resource) || root_url
  end

  def after_sign_out_path_for(resource_or_scope)
    params[:next] || super
  end
end

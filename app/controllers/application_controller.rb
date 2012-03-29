class ApplicationController < ActionController::Base
  protect_from_forgery

  private 
  
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

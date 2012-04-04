class PasswordsController < Devise::PasswordsController

  # GET /resource/password/new
  def new
    build_resource({})
  end

  # POST /resource/password
  def create
    user = User.where(:username => params[resource_name][:username]).first
    if user
      params[resource_name][:email] = user.email
      params[resource_name].delete("username")
      self.resource = resource_class.send_reset_password_instructions(params[resource_name])

      if successfully_sent?(resource)
        respond_with({}, :location => after_sending_reset_password_instructions_path_for(resource_name))
      else
        respond_with(resource)
      end
    else  
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end

class PhoneController < Devise::RegistrationsController

  def new
    build_resource
    yield resource if block_given?
    respond_with resource
  end

  def create
    total_sign_up_params(sign_up_params)
    if build_resource(sign_up_params).valid?(:registration_step_2)
      build_resource(sign_up_params)
      redirect_to address_new_path
    else
      render phone_new_path
    end
  end


protected

  def total_sign_up_params(sign_up_params={})
    session[:user] = session[:user].merge(sign_up_params)
  end

end

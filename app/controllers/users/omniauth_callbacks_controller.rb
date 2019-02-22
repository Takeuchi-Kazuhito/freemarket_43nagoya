# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for :facebook
  end

  def google
    callback_for :google
  end

  private

  def callback_for(provider)
    provider = provider.to_s
    @user = User.find_for_oauth(request.env['omniauth.auth'])
    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      session[:sns_user] = request.env['omniauth.auth'].uid
      # key rename & delete
      request.env['omniauth.auth'][:info][:nickname] = request.env['omniauth.auth'][:info].delete(:name)
      request.env['omniauth.auth'][:info].delete(:first_name)
      request.env['omniauth.auth'][:info].delete(:last_name)
      session[:user] = request.env['omniauth.auth'][:info]
      if SnsCredential.find_by(uid: session[:sns_user]).user_id
        sign_in_and_redirect User.find(@user.user_id), event: :authentication
      else
        redirect_to snsphone_new_path
      end
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
end

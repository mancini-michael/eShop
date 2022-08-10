class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(auth)
    if @user.present?
      sign_in_and_redirect @user, event: :authentication
    end
  end

  def google_oauth2
    @user = User.from_omniauth(auth)
    if @user.present?
      session[:access_token] = auth[:credentials][:token]
      sign_in_and_redirect @user, event: :authentication
    end
  end

  def failure
    redirect_to root_path
  end

  def auth
    @auth ||= request.env["omniauth.auth"]
  end
end

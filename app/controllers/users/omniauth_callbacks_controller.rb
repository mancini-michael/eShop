class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(auth)
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      redirect_to root_path
    end
  end

  def google_oauth2
    @user = User.from_omniauth(auth)
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      redirect_to root_path
    end
  end

  def failure
    redirect_to root_path
  end

  def auth
    @auth ||= request.env["omniauth.auth"]
  end
end

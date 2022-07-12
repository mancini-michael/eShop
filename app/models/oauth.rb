class Oauth < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |oauth|
      oauth.email = auth.info.email
      oauth.password = Devise.friendly_token[0,20]
    end
  end
    
  def self.new_with_session(params, session)
    super.tap do |oauth|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        oauth.email = data["email"] if oauth.email.blank?
      end
    end
  end
end
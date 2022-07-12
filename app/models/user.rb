class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :omniauthable,
         omniauth_providers: [:facebook]

  has_one :seller
  has_many :review

  geocoded_by :address
  after_validation :geocode

  def address
    [city, zip_code].join(", ")
  end

  def location
    [latitude, longitude]
  end

  def distance_from(coordinates)
    distance =
      Geocoder::Calculations.distance_between(
        [latitude, longitude],
        coordinates,
        units: :km
      ).to_i
    return "near to you" if distance <= 10
    "#{distance} km away"
  end

  private

  def self.full_name(user)
    "#{user.first_name} #{user.last_name}"
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      # user.city = "Zagarolo"
      # user.zip_code = "00039"
      parse_name(user, auth.info.name)
    end
  end

  def self.parse_name(user, name)
    name_arr = name.split(" ")
    user.last_name = name_arr.pop
    user.first_name = name_arr.join(" ")
  end

  # def self.new_with_session(params, session)
  #   super.tap do |oauth|
  #     if data =
  #          session["devise.facebook_data"] &&
  #            session["devise.facebook_data"]["extra"]["raw_info"]
  #       oauth.email = data["email"] if oauth.email.blank?
  #     end
  #   end
  # end
end

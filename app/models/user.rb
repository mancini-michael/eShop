class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  has_one :seller, dependent: :destroy
  has_many :cart
  has_many :meeting
  has_many :review
  has_many :wishlist
  has_many :question
  has_many :history

  geocoded_by :geocoding_address
  after_validation :geocode

  def geocoding_address
    [city, zip_code].join(", ")
  end

  def location
    [latitude, longitude]
  end

  def distance_from(coordinates)
      return if location.include?(nil) || coordinates.include?(nil)
      Geocoder::Calculations.distance_between(location, coordinates, units: :km).to_i
  end

  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.avatar = auth.info.image
      parse_name(user, auth.info.name)
    end
  end

  private

  def self.full_name(id)
    user = User.find(id)
    "#{user.first_name} #{user.last_name}"
  end

  def self.parse_name(user, name)
    name_arr = name.split(" ")
    user.first_name = name_arr.first
    user.last_name = name_arr.last
  end
end

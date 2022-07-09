class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

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
end

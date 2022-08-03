class Question < ApplicationRecord
  belongs_to :insertion
  belongs_to :user

  validates :question, presence: true
end

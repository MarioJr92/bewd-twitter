class Session < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true

  before_validation :generate_token

  private
    def generate_token
      self.token = SecureRandom.urlsafe_base64
    end
end
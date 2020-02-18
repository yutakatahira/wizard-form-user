class User < ApplicationRecord
  has_one :user_detail
  accepts_nested_attributes_for :user_detail
  has_secure_password validations: false
  before_create :create_remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{7,}\z/

  validates :nickname, presence: true, on: :step2
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, on: :step2
  validates :password_digest, presence: true, length: { minimum: 7 }, format: { with: VALID_PASSWORD_REGEX }, on: :step2

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end

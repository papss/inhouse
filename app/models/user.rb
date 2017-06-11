class User < ApplicationRecord

  has_many :league_users
  has_many :leagues, :through => :league_users, dependent: :destroy

  attr_accessor :remember_token

  before_save { self.email_address = email_address.downcase }

  validates :user_name,           presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_address,       presence: true, length: { maximum: 255 },
                                  format: { with: VALID_EMAIL_REGEX },
                                  uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password,            presence: true, length: { minimum: 6 }, allow_nil: true

  # hash digest
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # remember token:
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # remembers a user for persistent sessions:
  def remember
    self.remember_token = User.new_token
    update_attribute(:remeber_digest, User.digest(remember_token))
  end

  # matches token and digest:
  def authenticated?(remember_token)
    return false if remeber_digest.nil?
    BCrypt::Password.new(remeber_digest).is_password?(remember_token)
  end

  # forget a user:
  def forget
    update_attribute(:remeber_digest, nil)
  end

end

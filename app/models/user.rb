class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  has_secure_password
  validates_confirmation_of :password, :if => :validate_password?

  has_many :ideas

  enum role: [:default, :admin]

  def validate_password?
    password.present? || password_confirmation.present?
  end


end

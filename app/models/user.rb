class User < ActiveRecord::Base

  has_secure_password

  has_many :babies

  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false}

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  validates :password,
    presence: true,
    :on => :create

end

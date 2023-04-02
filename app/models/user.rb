class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  validates :email, length: {minimum: 5, maximum: 40}, allow_blank: false, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :first_name, length: {minimum: 1, maximum: 20}, allow_blank: false
    validates :last_name, length: {minimum: 1, maximum: 20}, allow_blank: false
    validates :encrypted_password,  length: {minimum: 8}, allow_blank: false

    has_many :feed_posts
end

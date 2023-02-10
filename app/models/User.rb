class User < ApplicationRecord
    has_many :messages
    has_secure_password validations: false
    validates_uniqueness_of :email, on: :create, message: "must be unique"
    validates :email, presence: true, length: {maximum: 500}, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password_digest, presence: true, length: {minimum: 6, maximum: 500}
end
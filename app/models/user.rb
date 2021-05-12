class User < ApplicationRecord

validates :username, presence: :true
validates :email, confirmation: :true
validates :email_confirmation, presence: :true
#validates :email, uniqueness: :true
validates :username, uniqueness: { case_sensitive: false }

    has_many :goals, dependent: :destroy
    has_many :categories, through: :goals
    has_many :comments

    has_secure_password

    accepts_nested_attributes_for :goals

end

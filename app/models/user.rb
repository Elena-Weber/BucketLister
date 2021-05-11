class User < ApplicationRecord

    has_many :goals, dependent: :destroy
    has_many :categories, through: :goals
    has_many :comments

    has_secure_password

    accepts_nested_attributes_for :goals

end

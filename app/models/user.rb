class User < ApplicationRecord
validates :username, presence: :true
validates :username, length: { minimum: 3 }
validates :username, uniqueness: { case_sensitive: false }
validates :email, presence: :true
#validates :email, confirmation: :true
validates :email, uniqueness: :true

has_many :goals, dependent: :destroy
has_many :categories, through: :goals
has_many :comments
has_secure_password

accepts_nested_attributes_for :goals
accepts_nested_attributes_for :comments

end
class Category < ApplicationRecord

    has_many :goals, dependent: :destroy
    has_many :users, through: :goals
    has_many :comments, through: :goals

end

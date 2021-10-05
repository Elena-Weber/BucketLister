class Category < ApplicationRecord

    # relations in db
    has_many :goals, dependent: :destroy
    has_many :users, through: :goals
    has_many :comments, through: :goals

    accepts_nested_attributes_for :goals

end
class Goal < ApplicationRecord
  validates :content, :details, :month, presence: :true

  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :comments
end

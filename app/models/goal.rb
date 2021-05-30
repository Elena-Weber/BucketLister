class Goal < ApplicationRecord
  validates :content, :details, :month, presence: :true

  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :comments

  scope :true_achieved, -> {where(achieved: true)}

  # def self.true_achieved
  #   where(achieved: true)
  # end

  def self.false_achieved
    where(achieved: false)
  end

  def self.first_goals
    all.limit(5)
  end

  def self.latest_goals
    all.order(id: :desc).limit(5)
  end

  def self.fulfilled
    where(achieved: true).order('RANDOM()').limit(5)
  end

  def self.unfulfilled
    where(achieved: false).order('RANDOM()').limit(5)
  end

  def self.fulfilled10
    where(achieved: true).order('RANDOM()').limit(10)
  end

  def self.num_of_goals_in_cat
    where(achieved: true).order('RANDOM()').limit(5)
  end

end

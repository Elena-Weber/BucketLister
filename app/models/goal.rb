class Goal < ApplicationRecord
  validates :content, :details, :month, presence: :true

  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :comments

  scope :true_achieved, -> { where(achieved: true) }
  scope :false_achieved, -> { where(achieved: false) }
  scope :fulfilled, -> { where(achieved: true).order('RANDOM()').limit(5) }
  scope :unfulfilled, -> { where(achieved: false).order('RANDOM()').limit(5) }

  def self.first_goals
    all.limit(5)
  end

  def self.latest_goals
    all.order(id: :desc).limit(5)
  end

  def self.fulfilled10
    where(achieved: true).order('RANDOM()').limit(10)
  end

  def self.num_of_goals_in_cat
    where(achieved: true).order('RANDOM()').limit(5)
  end

  def self.in_category(category_id)
    where(category: category_id)
  end

  def self.goal_most_comments
    Goal.all.sort_by { |most| most.comments.size }.last
  end

  def self.goal_least_comments
    Goal.all.sort_by { |least| least.comments.size }.first
  end

end

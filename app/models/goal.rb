class Goal < ApplicationRecord
  # validates goal content
  validates :content, :details, :month, presence: :true

  # relations in db
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :comments

  # setting up goals filtering
  scope :true_achieved, -> { where(achieved: true) }
  scope :false_achieved, -> { where(achieved: false) }
  scope :fulfilled, -> { where(achieved: true).order('RANDOM()').limit(5) }
  scope :unfulfilled, -> { where(achieved: false).order('RANDOM()').limit(5) }

  def self.first_goals # 5 oldest goals
    all.limit(5)
  end

  def self.latest_goals # 5 latest goals
    all.order(id: :desc).limit(5)
  end

  def self.fulfilled10 # 10 random achieved goals
    where(achieved: true).order('RANDOM()').limit(10)
  end

  def self.num_of_goals_in_cat # 5 random achieved goals
    where(achieved: true).order('RANDOM()').limit(5)
  end

  def self.in_category(category_id) # number of goals in category
    where(category: category_id)
  end

  def self.goal_most_comments # goal with most comments
    Goal.all.sort_by { |most| most.comments.size }.last
  end

  def self.goal_least_comments # goal with smallest number of comments
    Goal.all.sort_by { |least| least.comments.size }.first
  end

end

class Goal < ApplicationRecord
  validates :content, :details, :month, presence: :true

  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :comments

  def self.true_achieved
    where(achieved: true)
  end

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
    where(achieved: false).limit(5)
  end

  def self.search(search)
    if search
      @goalie = Goal.find_by(content: search)
      if @goalie
        self.where(content: @goalie)
        #binding.pry
      else
        @goals = Goal.all
      end
    else
      @goals = Goal.all
    end
  end

end

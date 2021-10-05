class Comment < ApplicationRecord
  # validates comments content
  validates :content, presence: :true

  # relations in db
  belongs_to :user
  belongs_to :goal

  def self.randcoms # random comments
    all.order('RANDOM()').limit(10)
  end

end

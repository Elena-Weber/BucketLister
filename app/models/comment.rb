class Comment < ApplicationRecord
  validates :content, presence: :true

  belongs_to :user
  belongs_to :goal

  def self.randcoms
    all.order('RANDOM()').limit(10)
  end

end

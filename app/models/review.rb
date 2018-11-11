class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :bird

  scope :all_comments, ->{order(created_at: :desc)}

  validates :comment, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 5, less_than_or_equal_to: 50 }

  def rating_float
    rating*0.1
  end
end

class Review < ActiveRecord::Base
  
  belongs_to :restaurants
  validates :rating, presence: true, :inclusion => {:in => [1,2,3,4,5], message:"1..5 please"}
  validates :restaurant_id, presence: true
  validates :body, presence: true, length: { maximum: 500, message:"Body is too long (max 500 characters)" } 
end
class Review < ActiveRecord::Base
  belongs_to :organization
  belongs_to :user
  # def avg_rating
  #   self.class.average(:rating).where(:rating => self.rating)
  # end
end
# 
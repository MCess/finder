class Organization < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  has_many :reviews
  geocoded_by :address1
  after_validation :geocode
end
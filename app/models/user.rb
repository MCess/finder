class User < ActiveRecord::Base
  has_many :organizations
  has_many :reviews
end

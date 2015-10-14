class User < ActiveRecord::Base
  has_many :bids
  validates :email, uniqueness: true
  validates :password, length: {minimum: 6}
end

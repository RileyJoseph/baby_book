class Baby < ActiveRecord::Base
  belongs_to :user
  has_many :stats
  has_many :events
  has_many :treatments
end

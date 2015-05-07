class Baby < ActiveRecord::Base
  belongs_to :user
  has_many :stats
  has_many :events
end

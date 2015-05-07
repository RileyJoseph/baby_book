class Event < ActiveRecord::Base
  belongs_to :baby
  has_many :media
end

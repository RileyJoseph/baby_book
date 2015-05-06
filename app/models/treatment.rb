class Treatment < ActiveRecord::Base
  belongs_to :vaccination
  belongs_to :baby
end

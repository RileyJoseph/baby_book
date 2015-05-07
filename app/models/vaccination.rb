class Vaccination < ActiveRecord::Base
  has_many :treatments
end

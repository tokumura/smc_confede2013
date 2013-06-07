class Information < ActiveRecord::Base
  attr_accessible :infobody, :informant, :title
  has_many :comments
end

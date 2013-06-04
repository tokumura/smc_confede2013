class PartTwoPredict < ActiveRecord::Base
  attr_accessible :team_a, :team_b, :team_c, :team_d, :user_id
  belongs_to :user
end

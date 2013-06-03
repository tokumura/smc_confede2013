class PartOnePredict < ActiveRecord::Base
  attr_accessible :game_no, :score_a, :score_b, :user_id
  belongs_to :users
end

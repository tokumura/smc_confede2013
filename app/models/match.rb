class Match < ActiveRecord::Base
  attr_accessible :game_no, :score_a, :score_b, :team_a, :team_b, :flag_a, :flag_b
end

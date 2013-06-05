class PartTwoPredict < ActiveRecord::Base
  attr_accessible :team_a, :team_b, :team_c, :team_d, :user_id
  belongs_to :user

  def self.init(user_id)
    PartTwoPredict.destroy_all(["user_id = ?", user_id])
    user = User.find(user_id)
    pop = user.build_part_two_predict
    pop.team_a = ""
    pop.team_b = ""
    pop.team_c = ""
    pop.team_d = ""
    pop.save
  end
end

class PartThreePredict < ActiveRecord::Base
  attr_accessible :team_a, :team_b, :team_c, :score_a, :score_b, :score_c, :score_d, :score_e, :score_f
  belongs_to :user

  def self.init(user_id)
    PartThreePredict.destroy_all(["user_id = ?", user_id])
    user = User.find(user_id)
    pop = user.build_part_three_predict
    pop.team_a = ""
    pop.team_b = ""
    pop.team_c = ""
    pop.save
  end
end

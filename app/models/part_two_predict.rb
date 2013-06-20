# coding: utf-8
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

  def self.get_your_predict_label(user_id, country)
    user = User.find(user_id)
    label = false
    if user.part_two_predict.team_a == country
      label = true 
    elsif user.part_two_predict.team_b == country
      label = true 
    elsif user.part_two_predict.team_c == country
      label = true 
    elsif user.part_two_predict.team_d == country
      label = true 
    end
    label
  end

  def self.calc(predict)
    point = 0
    result_a = ["brazil", "italia"]
    result_b = ["spain", "uruguay"]
    if result_a.include?(predict.team_a)
      point = point + 3
    end
    if result_a.include?(predict.team_b)
      point = point + 3
    end
=begin
    if result_b.include?(predict.team_c)
      point = point + 3
    end
    if result_b.include?(predict.team_d)
      point = point + 3
    end
    point
=end
  end
end

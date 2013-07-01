class PartThreePredict < ActiveRecord::Base
  attr_accessible :team_a, :team_b, :team_c, :score_a, :score_b, :score_c, :score_d, :score_e, :score_f, :score_g, :score_h
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

  def self.init_score
    users = User.all
    users.each do |u|
      pthp = u.part_three_predict
      pthp.score_a = 0
      pthp.score_b = 0
      pthp.score_c = 0
      pthp.score_d = 0
      pthp.score_e = 0
      pthp.score_f = 0
      pthp.score_g = 0
      pthp.score_h = 0
      pthp.save
    end
  end

  def self.calc_pop
    users = User.all
    users.each do |u|
      point = 0
      pthp = u.part_three_predict
      if pthp.score_a && pthp.score_b
        if pthp.score_a > pthp.score_b
          point = point + 3
        end
        if pthp.score_a == 2 && pthp.score_b == 1
          point = point + 3
        end
      end

      if pthp.score_c > pthp.score_d
        point = point + 3
      end
      if pthp.score_c == 1 && pthp.score_d == 0
        point = point + 3
      end

      if pthp.score_e < pthp.score_f
        point = point + 3
      end
      if pthp.score_e == 2 && pthp.score_f == 3
        point = point + 3
      end

      if pthp.score_g > pthp.score_h
        point = point + 3
      end
      if pthp.score_g == 3 && pthp.score_h == 0
        point = point + 3
      end

      if pthp.team_a == "brazil"
        point = point + 9
      end
      if pthp.team_b == "spain"
        point = point + 6
      end
      if pthp.team_c == "italia"
        point = point + 6
      end

      u.total_point = u.total_point + point
      u.save
    end
  end

  def self.hit_status(user_id, match_no)
    status = ""
    user = User.find(user_id)
    pthp = user.part_three_predict

    if match_no == 1
      if pthp.score_a && pthp.score_b
        if pthp.score_a > pthp.score_b
          status = "hit"
          if pthp.score_a == 2 && pthp.score_b == 1
            status = "just"
          end
        end
      end
    elsif match_no == 2
      if pthp.score_c > pthp.score_d
        status = "hit"
        if pthp.score_c == 1 && pthp.score_d == 0
          status = "just"
        end
      end
    elsif match_no == 3
      if pthp.score_e < pthp.score_f
        status = "hit"
        if pthp.score_e == 2 && pthp.score_f == 3
          status = "just"
        end
      end
    elsif match_no == 4
      if pthp.score_g > pthp.score_h
        status = "hit"
        if pthp.score_g == 3 && pthp.score_h == 0
          status = "just"
        end
      end
    end
    
    status
  end
end

class PartOnePredict < ActiveRecord::Base
  attr_accessible :game_no, :score_a, :score_b, :user_id
  belongs_to :users

  def self.init(user_id)
    PartOnePredict.destroy_all(["user_id = ?", user_id])
    user = User.find(user_id)
    (1..12).each do |p|
      pop = user.part_one_predict.build
      pop.game_no = p 
      pop.score_a = "0"
      pop.score_b = "0"
      pop.save
    end
  end

  def self.initall
    PartOnePredict.destroy_all
    users = User.all
    users.each do |u|
      (1..12).each do |p|
        pop = u.part_one_predict.build
        pop.game_no = p 
        pop.score_a = 0
        pop.score_b = 0
        pop.save
      end
    end
  end

  def self.calc_pop
    users = User.all
    users.each do |u|
      pop_point = 0
      u.part_one_predict.each do |pop|
        match = Match.find_by_game_no(pop.game_no)
        if match.done
          result = get_result_of_match(pop.game_no)
          predict = get_your_predict(pop)
          if predict == result
            pop_point = pop_point + 3
          end
          if pop.score_a == match.score_a && pop.score_b == match.score_b
            pop_point = pop_point + 3
          end
        end
      end
      u.total_point = pop_point
      u.save
    end
  end

  def self.get_result_of_match(game_no)
    match = Match.find_by_game_no(game_no)
    if match.score_a > match.score_b
      result = "a_win"
    elsif match.score_a < match.score_b
      result = "b_win"
    else
      result = "even"
    end
    result
  end

  def self.get_your_predict(pop)
    if pop.score_a > pop.score_b
      predict = "a_win"
    elsif pop.score_a < pop.score_b
      predict = "b_win"
    else
      predict = "even"
    end
    predict
  end

  def self.get_your_predict_label(user_id, game_no, overlook)
    user = User.find(user_id)
    label = ""
    user.part_one_predict.each do |ptp|
      if ptp.game_no == game_no
        match = Match.find_by_game_no(ptp.game_no)
        if overlook
          label = ptp.score_a.to_s + " - " + ptp.score_b.to_s
        else
          label = match.team_a[0..0] + " " + ptp.score_a.to_s + " - " + ptp.score_b.to_s + " " + match.team_b[0..0]
        end
      end
    end
    label
  end

  def self.hit_status(user_id, game_no)
    status = ""
    match = Match.find_by_game_no(game_no)
    if match.done
      pop = PartOnePredict.where(['user_id = ? AND game_no = ?', user_id, game_no])[0]
      predict = get_your_predict(pop)
      result = get_result_of_match(game_no)
      puts predict
      if predict == result
        status = "hit"
        if pop.score_a == match.score_a && pop.score_b == match.score_b
          status = "just"
        end
      end
    end
    status
  end

end

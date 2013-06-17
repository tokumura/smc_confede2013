class DashboardController < ApplicationController
  def index
    user = User.find(current_user.id)
    if !user.part_two_predict 
      PartTwoPredict.init(user.id.to_s)
    end

    if user.part_one_predict.size == 0
      PartOnePredict.init(user.id.to_s)
    end

    matches = Match.all
    if matches.size == 0
      Match.init
    end

    @matches = Match.order("game_no ASC")
    ptr = PartTwoResult.all
    @ptresult_a = ptr[0].team_a
    @ptresult_b = ptr[0].team_b
    @ptresult_c = ptr[0].team_c
    @ptresult_d = ptr[0].team_d

    if !user.total_point
      user.total_point = 0
    end
    PartOnePredict.calc_pop
    @users_ranked = User.order("total_point DESC")

    @news = News.order('created_at DESC')
    @highlights = Highlight.order('created_at DESC')

    respond_to do |format|
      format.html
    end
  end
end

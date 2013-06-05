# coding: utf-8
class Match < ActiveRecord::Base
  attr_accessible :game_no, :score_a, :score_b, :team_a, :team_b, :flag_a, :flag_b


  def self.init
    (1..12).each do |i|
      case i
      when 1
        set_match(i,"ブラジル","日本","brazil","japan")
      when 2
        set_match(i,"メキシコ","イタリア","mexico","italia")
      when 3
        set_match(i,"スペイン","ウルグアイ","spain","uruguay")
      when 4
        set_match(i,"タヒチ","ナイジェリア","tahichi","nigeria")
      when 5
        set_match(i,"ブラジル","メキシコ","brazil","mexico")
      when 6
        set_match(i,"イタリア","日本","italia","japan")
      when 7
        set_match(i,"スペイン","タヒチ","spain","tahichi")
      when 8
        set_match(i,"ナイジェリア","ウルグアイ","nigeria","uruguay")
      when 9
        set_match(i,"イタリア","ブラジル","italia","brazil")
      when 10
        set_match(i,"日本","メキシコ","japan","mexico")
      when 11
        set_match(i,"ナイジェリア","スペイン","nigeria","spain")
      when 12
        set_match(i,"ウルグアイ","タヒチ","uruguay","tahichi")
      else
      end
    end
  end

  def set_match(game_no, team_a, team_b, flag_a, flag_b)
    match = Match.new
    match.game_no = game_no
    match.score_a = "0"
    match.score_b = "0"
    match.team_a = team_a
    match.team_b = team_b
    match.flag_a = flag_a
    match.flag_b = flag_b
    match.save
  end

end


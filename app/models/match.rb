# coding: utf-8
class Match < ActiveRecord::Base
  attr_accessible :game_no, :score_a, :score_b, :team_a, :team_b, :flag_a, :flag_b, :goal_a, :goal_b, :day, :done, :closingday

  def self.init
    Match.destroy_all
    (1..12).each do |i|
      case i
      when 1
        set_match(i,"ブラジル","日本","brazil","japan", "6/15 (sat)")
      when 2
        set_match(i,"メキシコ","イタリア","mexico","italia", "6/16 (sun)")
      when 3
        set_match(i,"スペイン","ウルグアイ","spain","uruguay", "6/16 (sun)")
      when 4
        set_match(i,"タヒチ","ナイジェリア","tahichi","nigeria", "6/17 (mon)")
      when 5
        set_match(i,"ブラジル","メキシコ","brazil","mexico", "6/19 (wed)")
      when 6
        set_match(i,"イタリア","日本","italia","japan", "6/19 (wed)")
      when 7
        set_match(i,"スペイン","タヒチ","spain","tahichi", "6/20 (thu)")
      when 8
        set_match(i,"ナイジェリア","ウルグアイ","nigeria","uruguay", "6/20 (thu)")
      when 9
        set_match(i,"イタリア","ブラジル","italia","brazil", "6/22 (sat)")
      when 10
        set_match(i,"日本","メキシコ","japan","mexico", "6/22 (sat)")
      when 11
        set_match(i,"ナイジェリア","スペイン","nigeria","spain", "6/23 (sun)")
      when 12
        set_match(i,"ウルグアイ","タヒチ","uruguay","tahichi", "6/23 (sun)")
      else
      end
    end
  end

  def self.set_match(game_no, team_a, team_b, flag_a, flag_b, day)
    match = Match.new
    match.game_no = game_no
    match.score_a = 0
    match.score_b = 0
    match.team_a = team_a
    match.team_b = team_b
    match.flag_a = flag_a
    match.flag_b = flag_b
    match.day = day
    match.done = false
    match.save
  end

  def self.convert_country(en)
    jp = ""
    case en
    when "brazil"
      jp = "ブラジル"
    when "japan"
      jp = "日本"
    when "mexico"
      jp = "メキシコ"
    when "italia"
      jp = "イタリア"
    when "spain"
      jp = "スペイン"
    when "uruguay"
      jp = "ウルグアイ"
    when "tahichi"
      jp = "タヒチ"
    when "nigeria"
      jp = "ナイジェリア"
    end
    jp
  end


end


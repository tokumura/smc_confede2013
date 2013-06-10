# coding: utf-8
class News < ActiveRecord::Base
  attr_accessible :news_body
  def self.regist(body)
    news = News.new
    news.news_body = body
    #news.news_body = body + "　　- " + Time.now.strftime("%Y/%m/%d %p")
    news.save
  end
end

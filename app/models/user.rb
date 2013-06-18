class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :account, :tatal_point
  # attr_accessible :title, :body

  has_many :part_one_predict
  has_one :part_two_predict

  # email_required? メソッドを追加
  def email_required?
    false
  end

  # UserAgent
  def self.check_user_agent(request)
    agent = "D"
    ua = request.env["HTTP_USER_AGENT"]
    if(ua.include?('Mobile') || ua.include?('Android'))
      agent = "M"
    end
    agent
  end

  def self.calc_total_point
    PartOnePredict.calc_pop
    users = User.all
    users.each do |u|
      ptp_point = PartTwoPredict.calc(u.part_two_predict)
      u.total_point = u.total_point + ptp_point
      u.save
    end
  end
end

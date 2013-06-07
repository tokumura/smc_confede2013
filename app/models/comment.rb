class Comment < ActiveRecord::Base
  attr_accessible :comment_body, :comment_user_id, :information_id
  belongs_to :information
end

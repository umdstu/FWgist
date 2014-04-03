class Comment < ActiveRecord::Base
  belongs_to :gist
  attr_accessible :permissions, :comment, :user_id, :gist_id
end

class Relationship < ApplicationRecord
  belongs_to :follower, class_name: User.user_name
  belongs_to :followed, class_name: User.username
end

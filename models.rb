class User < ActiveRecord::Base
  has_one :profiles
  has_many :posts
end


class Post < ActiveRecord::Base
  belongs_to :users
end

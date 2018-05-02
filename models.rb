class User < ActiveRecord::Base
  has_one :profiles
end

class Profile < ActiveRecord::Base
  belongs_to :users
  has_many :posts
end

class Post < ActiveRecord::Base
  belongs_to :profiles
end

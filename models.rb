class User < ActiveRecord::Base
  has_one :profiles
  has_many :posts
  has_many :searches
  def self.search(keyword)
    where("username like ?", "%#{keyword}%")
  end
end


class Post < ActiveRecord::Base
  belongs_to :users
end

class Search < ActiveRecord::Base
  belongs_to :users
end

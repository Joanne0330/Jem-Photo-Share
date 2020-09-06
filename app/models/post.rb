class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :photo, type: String
  
end
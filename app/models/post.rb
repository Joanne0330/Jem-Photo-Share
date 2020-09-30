class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  # before_create :owner
  belongs_to :user
  
  # def owner
  #   self.user_id = current_user.id
  # end

  has_mongoid_attached_file :image,
    :styles => {
        :medium   => ['250x250',    :jpg]
      }
    
  has_many :comments
  field :title, type: String
  validates_attachment_content_type :image, content_type: /image/    
  
  
end
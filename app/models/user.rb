class User < ActiveRecord::Base

  ANON = "Anonymous"
  
  paginates_per 5

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :pepper => Devise.pepper

  validates :username, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true, :on => :create
  validates :password, :length => Devise.password_length, :allow_blank => true
  validates :password, :confirmation => true
  validates :email, :presence => true
  validates_format_of :email, :with  => Devise.email_regexp, :allow_blank => true

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :username

  has_many :hailwtfornots
  has_many :images
  
  after_validation(:on => :create) do
    self.image_id = (1..Image.all.count).to_a.sample
  end
  
  belongs_to :image, :class_name => 'Image', :foreign_key => :image_id

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png','image/gif']
  validates_attachment_size :avatar, :less_than => 1.megabytes
end

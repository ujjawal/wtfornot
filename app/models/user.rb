class User < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png','image/gif']
  validates_attachment_size :avatar, :less_than => 1.megabytes
end

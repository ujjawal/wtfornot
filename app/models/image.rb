class Image < ActiveRecord::Base
  paginates_per 5
  has_attached_file :file, :styles => { :medium => "400x400>", :thumb => "100x100>" }
  validates_attachment_content_type :file, :content_type => ['image/jpeg', 'image/png','image/gif']
  validates_attachment_size :file, :less_than => 1.megabytes
end

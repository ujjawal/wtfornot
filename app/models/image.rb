class Image < ActiveRecord::Base
  paginates_per 4
  validates :file_file_name, :file_content_type, :file_file_size, :presence => true

  belongs_to :user

  after_validation(:on => :create) do
    self.name = self.file_file_name if self.name.blank?
  end

  has_attached_file :file, :styles => { :medium => "400x400>", :thumb => "100x100>" }
  validates_attachment_content_type :file, :content_type => ['image/jpeg', 'image/png','image/gif']
  validates_attachment_size :file, :less_than => 1.megabytes
end

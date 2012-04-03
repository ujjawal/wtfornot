class ContentTypeValidator < ActiveModel::Validator
  def validate(record)
    if !record.file_content_type.blank? and !['image/jpeg', 'image/gif','image/png'].include?(record.file_content_type)
      record.errors[:base] << "Image '#{record.file_file_name}' is not a valid image type"
    end
  end 
end

class Image < ActiveRecord::Base

  paginates_per 4

  validates :file_file_name, :file_content_type, :file_file_size, :presence => true
  
  validates_with ContentTypeValidator

  belongs_to :user

  after_validation(:on => :create) do
    self.name = self.file_file_name if self.name.blank?
  end

  if Rails.env == "production" 
    S3_CREDENTIALS = { :access_key_id => 'AKIAIWPX6QKC6D3ODS3Q', 
                       :secret_access_key => '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', 
                       :bucket => "giafprod"} 
  else 
    S3_CREDENTIALS = { :access_key_id => 'AKIAIWPX6QKC6D3ODS3Q', 
                       :secret_access_key => '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', 
                       :bucket => "giafdev"} 
  end

  has_attached_file :file, 
    :styles => { :medium => "400x400>", :thumb => "100x100>" },
    :storage => :s3,
    :s3_credentials => S3_CREDENTIALS,
    :path => ":attachment/:id/:style.:extension",
    :convert_options => { :all => "-auto-orient" }
  validates_attachment_size :file, :less_than => 1.megabytes, 
    :message => "Cannot digest files bigger than 1MB. Try again."
  
end

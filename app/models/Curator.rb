class Curator < ActiveRecord::Base
  has_many :collections
  has_many :observations
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png", :storage => :s3, :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def s3_credentials
    {
     bucket: Rails.application.secrets.s3_bucket,
     access_key_id: Rails.application.secrets.s3_key_id,
     secret_access_key: Rails.application.secrets.s3_secret_key
    }
  end


end

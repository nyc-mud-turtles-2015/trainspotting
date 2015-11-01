class Observation < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "200x200#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g\Z/]

  belongs_to :curator
  belongs_to :collection, touch: true
<<<<<<< 1a88603b77e0196b93797527bb30f7e2a8a30a99

  validates :curator, :collection, presence: true
  has_one :pending_observation

  validates :curator, :collection, presence: true

  def is_pending?
    self.pending_observation != nil
  end

end

class Pic < ApplicationRecord
  acts_as_votable
  acts_as_taggable
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true
  validates :tag_list, presence: true
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: '/system/pics/images/no_image.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end

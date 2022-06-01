# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  caption        :text
#  comments_count :integer
#  image          :string
#  likes_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#
class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates(:poster, { :presence => true })
  validates(:image, { :presence => true })
  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy
  belongs_to :poster, :class_name => "User", :foreign_key => "owner_id"
  has_many :commenters, :through => :comments, :source => :author
  has_many :fans, :through => :likes, :source => :fan
 
end

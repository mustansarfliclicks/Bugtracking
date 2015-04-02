class Pbug < ActiveRecord::Base
  validates_presence_of :title, :description, :deadline
  belongs_to :creater, :class_name=>"User", :foreign_key=>'user_id'
  belongs_to :projects
  mount_uploader :image, ImageUploader  
end

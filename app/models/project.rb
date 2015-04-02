class Project < ActiveRecord::Base
  
  has_many :pbugs
  belongs_to :manager, :class_name=>"User", :foreign_key=>'user_id'
  has_many :assignments
  has_many :users, through: :assignments

end

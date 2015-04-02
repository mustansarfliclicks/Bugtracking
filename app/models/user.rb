class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bugs, :class_name=>'Pbug'
  # has_and_belongs_to_many :projects       
  has_many :ownprojects, :class_name=>"Project"
  has_many :assignments
  has_many :projects, through: :assignments

end

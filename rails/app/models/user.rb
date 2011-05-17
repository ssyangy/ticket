class User < ActiveRecord::Base

  has_many :members
  has_many :projects, :through => :members
  has_many :todos
  has_many :feedbacks
  
  acts_as_authentic

end

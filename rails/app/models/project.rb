class Project < ActiveRecord::Base
  has_many :members, :dependent => :destroy
  has_many :users, :through => :members
  
  has_many :tickets, :dependent => :destroy
  has_many :milestones, :dependent => :destroy
  
  def after_save
    @member = self.members.create(:user_id => self.owner)
  end

end

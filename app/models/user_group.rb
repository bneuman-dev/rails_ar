class UserGroup < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  after_create :post_save

  def post_save
    if self.user == self.group.creator
      self.update(access_level: 4)
    elsif self.access_level.nil?
      self.update(access_level: 1)
    end
  end
end

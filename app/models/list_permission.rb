class ListPermission < ActiveRecord::Base
  belongs_to :list_user
  belongs_to :list
  validates :list_user, uniqueness: { scope: :list }
  after_create :post_create

  def post_create
    self.update(permission_level: 2) if self.list_user == self.list.creator
  end
end

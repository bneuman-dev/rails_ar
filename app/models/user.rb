require_relative 'list_user'

class User < ListUser
  has_many :user_groups
  has_many :groups, through: :user_groups, class_name: "Group"
  has_many :admin_groups, -> {where "access_level > 3" }, through: :user_groups
  has_many :group_lists, through: :groups, source: :lists

  def create_group(group_name)
    group = self.groups.create(name: group_name, creator: self)
  end

  def make_list_readable_for_list_user(list, list_user)
    ListPermission.create(list: list, list_user: list_user, permission_level: 1)
  end

  def make_list_writeable_for_list_user(list, list_user)
    list = ListPermission.where(list: list, list_user: list_user).first_or_create
    list.update(permission_level: 2)
  end
  # Remember to create a migration!
end
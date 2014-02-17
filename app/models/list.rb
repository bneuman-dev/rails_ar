class List < ActiveRecord::Base
  belongs_to :creator, class_name: "ListUser"
  has_many :task_lists
  has_many :tasks, through: :task_lists
  has_many :list_permissions
  has_many :readers, -> { where 'permission = 1' }, through: :list_permissions
  has_many :writers, -> { where 'permission = 2' }, through: :list_permissions
  has_many :viewers, through: :list_permissions, source: :list_viewer
end

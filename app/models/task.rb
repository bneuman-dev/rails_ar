class Task < ActiveRecord::Base
  belongs_to :priority
  belongs_to :creator, class_name: "ListUser"
  has_many :task_lists
  has_many :lists, through: :task_lists

end

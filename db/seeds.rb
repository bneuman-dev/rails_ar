require 'faker'

Priority.create(priority: "low")
Priority.create(priority: "medium")
Priority.create(priority: "high")

users = ["Bob", "Frank", "Dopey", "Mopey",
          "Hoozit", "Whatzit", "Fowl", "Plotz"]

users.each do |name|
  user = User.create(name: name)
  2.times do
    user.create_list(Faker::Company.bs)
  end

  user.lists.each do |list|
    10.times do
      priority = rand(1..3)
      deadline = Time.new(2016, 02, 14, 17, 15, 33)
      description = Faker::Lorem.paragraph
      params = {priority_id: priority, deadline: 
                deadline, description: description, completed: false}
      user.create_task_for_list(list, params)
    end
  end
end

User.all.each do |user|
  user.lists.each do |list|
    User.all.reject { |u2| u2 == user}.each do |u2|
      perm = rand(1..3)
      if perm == 1
        user.make_list_readable_for_list_user(list, u2)
      elsif perm == 2
        user.make_list_writeable_for_list_user(list, u2)
      end
    end
  end
end

groups = ["Frogs", "Toads", "Foxes", "Squirrels", "Salamanders"]

User.all.each do |user|
  coin = rand(1..2)
  if coin == 1
    group = user.create_group(Faker::Company.name)
    list = group.create_list(Faker::Company.bs)
    User.all.reject { |u2| u2 == user}.each do |u2|
      coin2 = rand(1..4)
      if coin2 == 2
        group.users << u2
        coin3 = rand(1..3)
        ug = group.user_groups.find_by(user: u2)
        ug.update(access_level: coin3)
      elsif coin2 == 3
        group.users << u2
        group.make_admin(u2)

      end

    end
  end
end




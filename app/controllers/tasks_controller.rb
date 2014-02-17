class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(priority: Priority.find(1))

  end

  def create
    @list = List.find(params[:list_id])
    creator = @list.creator
    @task = @list.tasks.create(description: params[:task][:description],
                               deadline: params[:task][:deadline],
                               priority: Priority.find_by(priority: params[:task][:priority]),
                               completed: false,
                               creator: creator)
    redirect_to list_path(@list)
  end

  def edit
    @task = Task.find(params[:id])
    @list = @task.lists.first
  end

  def update
    @task = Task.find(params[:id])
    tp = params[:task]
    @task.update(description: tp[:description],
                 deadline: tp[:deadline],
                 priority: Priority.find_by(priority: tp[:priority]),
                 completed: tp[:completed])
                
    redirect_to task_path(@task)
  end

  def show
    @task = Task.find(params[:id])
  end
end

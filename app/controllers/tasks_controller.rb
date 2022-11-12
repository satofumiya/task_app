class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params.require(:task).permit(:title,:start,:end,:all_day,:memo))
    if @task.save
      flash[:notice] = "スケジュールを新規登録しました。"
      redirect_to :tasks
    else
      render "new"
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

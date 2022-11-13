class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_param)
    if @task.save

      redirect_to :tasks
      flash[:notice] = "スケジュールを新規登録しました。"
    else
      flash[:notice] = "スケジュールを登録できませんでした。"
      render "new"
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_param)
      flash[:notice] = "スケジュール情報を更新しました"
      redirect_to :tasks
    else
      flash[:notice] = "スケジュール情報を更新できませんでした。"
      render "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to :tasks
  end

  private
    def task_param
      params.require(:task).permit(:title,:start,:end,:all_day,:memo)
    end

end

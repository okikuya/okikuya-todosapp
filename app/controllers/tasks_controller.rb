class TasksController < ApplicationController
    before_action :set_board
    before_action :set_task, only: [:edit, :update, :destroy, :show]

    def index
      @tasks = @board.tasks
    end
  
    def new
      @task = @board.tasks.build
    end
  
    def create
      @task = @board.tasks.build(task_params)
      @task.user = current_user
      if @task.save
        redirect_to board_tasks_path(@board), notice: "タスクを作成しました"
      else
        flash.now[:error] = '作成できませんでした'
        render :new
      end
    end

    def show
    end

    def edit
    end
  
    def update
      if @task.update(task_params)
        redirect_to board_tasks_path(@board), notice: "タスクを更新しました"
      else
        flash.now[:error] = '更新できませんでした'
        render :edit
      end
    end
  
    def destroy
      @task.destroy
      redirect_to board_tasks_path(@board), notice: "タスクを削除しました"
    end
  
    private
  
    def set_board
      @board = Board.find(params[:board_id])
    end

    def set_task
      @task = @board.tasks.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to board_tasks_path(@board), alert: "指定されたタスクが見つかりません。"
    end
  
    def task_params
      params.require(:task).permit(:title, :content, :deadline, :eyecatch)
    end
end
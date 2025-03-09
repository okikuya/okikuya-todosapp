class CommentsController < ApplicationController
    before_action :set_task
    before_action :authenticate_user!
  
    def new
      @comment = Comment.new
    end
  
    def create
      @comment = @task.comments.build(comment_params)
      @comment.user = current_user
      if @comment.save
        redirect_to board_task_path(@task.board, @task), notice: 'コメントを追加しました。'
      else
        flash.now[:error] = 'コメントを追加できませんでした。'
        render :new
      end
    end
  
    private
  
    def set_task
      @task = Task.find(params[:task_id])
    end
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
  
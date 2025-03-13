class BoardsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_board, only: [:edit, :update, :destroy]
    before_action :authorize_user!, only: [:edit, :update, :destroy]

    def new
        @board = current_user.boards.build
    end

    def edit
        # @board は set_board でセットされる
    end

    def create
        @board = current_user.boards.build(board_params)
        if @board.save
            redirect_to root_path, notice: 'ボードを作成しました。'
        else
            flash.now[:error] = '作成できませんでした'
            render :new
        end
    end

    def update
        if @board.update(board_params)
            redirect_to boards_path, notice: "ボードを更新しました"
        else
            flash.now[:error] = '更新できませんでした'
            render :edit
        end
    end
    
    def destroy
        @board.destroy
        redirect_to boards_path, notice: "ボードを削除しました"
    end

    private

    def set_board
        @board = Board.find_by(id: params[:id])
        redirect_to boards_path, alert: "ボードが見つかりません" if @board.nil?
    end
    
    def authorize_user!
        redirect_to boards_path, alert: "権限がありません" if @board.nil? || @board.user != current_user
    end

    def board_params
        params.require(:board).permit(:name, :description, :avatar)
    end
end
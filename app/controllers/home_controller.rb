class HomeController < ApplicationController
    def index
        @boards = current_user.boards
        # @boards = Board.includes(:user).all
    end
end
class HomeController < ApplicationController
    def index
        @boards = Board.includes(:user).all
    end
end
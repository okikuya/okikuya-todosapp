class HomeController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @boards = Board.includes(:user).all
    end
end
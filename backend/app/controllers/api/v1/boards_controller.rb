module Api 
  module V1
    class BoardsController < ApplicationController

      def index 
        boards = Boards.all
        render json: @boards
      end

      def create 
        @board = @user.boards.new(board_params)
      end

      private
      
      def set_board
        @board = @user.boards.find(params[:id])
      end

      def set_user 
        @user = User.find(params[:id])
      end

    end
  end
end

module Api 
  module V1
    class BoardsController < ApplicationController

      # GET /boards
      def index 
        boards = Board.all
        render json: boards
      end

      # GET /boards/id
      def show
        @board = Board.find(params[:id])
        render json: @board
      end

      # POST /boards
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

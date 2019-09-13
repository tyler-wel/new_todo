module Api 
  class BoardsController < ApplicationController
    #before_action :authorize_request, except: [:create]
    before_action :find_user, except: [:all]
    before_action :find_board, except: [:index, :create, :all]

    # GET /users/{id}/boards
    def index 
      boards = @user.owned_boards
      render json: boards
    end

    # POST /users/{id}/boards
    def create 
      @board = @user.boards.new(board_params)
    end

    # GET /users/{id}/boards/{id}
    def show
      render json: @board
    end

    # DELETE /users/{id}/boards/{id}
    def delete

    end

    # GET /boards/all
    def all
      boards = Board.all
      render json: boards, :include => [:task_lists], status: :ok
    end

    private

    def board_params
      params.permit(
        :name
      )
    end

    def find_board
      @board = Board.find(params[:id])
    end

    def find_user 
      @user = User.find(params[:user_id])
    end

  end
end

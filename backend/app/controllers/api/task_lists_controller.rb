module Api 
  class TaskListsController < ApplicationController
    #before_action :authorize_request, except: [:create]
    before_action :find_user, except: [:all]
    before_action :find_board, except: [:all]
    before_action :find_task_list, except: [:index, :delete, :all]

    # GET /users/{id}/boards/{id}/task_lists
    def index 
      lists = @board.task_lists
      render json: lists
    end
    
    # POST /users/{id}/boards/{id}/task_lists
    def create 
      @list = @board.task_lists.new(task_list_params)
    end

    # GET /users/{id}/boards/{id}/task_lists/{id}
    def show
      render json: @list
    end

    # DELETE /users/{id}/boards/{id}/task_lists/{id}
    def delete

    end

    # GET /task_lists/all
    def all
      @lists = TaskList.all
      render json: @lists, :include => [:tasks], status: :ok
    end


    private

    def task_list_params
      params.permit(
        :name,
      )
    end

    def find_task_list
      @list = TaskList.find(params[:id])
    end

    def find_board
      @board = Board.find(params[:board_id])
    end

    def find_user 
      @user = User.find(params[:user_id])
    end
  end
end

module Api 
  class TasksController < ApplicationController
    #before_action :authorize_request, except: [:create]
    before_action :find_user, except: [:all]
    before_action :find_board, except: [:all]
    before_action :find_task_list, except: [:all]
    before_action :find_task, except: [:index, :delete, :all]

    # GET /users/{id}/boards/{id}/task_lists/{id}/tasks
    def index 
      tasks = @list.tasks
      render json: tasks
    end
    
    # POST /users/{id}/boards/{id}/task_lists/{id}/tasks
    def create 
      @task = @list.tasks.new(task_params)
    end

    # GET /users/{id}/boards/{id}/task_lists/{id}/tasks/{id}
    def show
      render json: @task
    end

    # DELETE /users/{id}/boards/{id}/task_lists/{id}/tasks/{id}
    def delete

    end

    # GET /task_lists/all
    def all
      tasks = Task.all
      render json: tasks
    end


    private

    def task_params
      params.permit(
        :name,
      )
    end

    def find_task
      @task = TaskList.find(params[:id])
    end

    def find_task_list
      @list = TaskList.find(params[:task_list_id])
    end

    def find_board
      @board = Board.find(params[:board_id])
    end

    def find_user 
      @user = User.find(params[:user_id])
    end
  end
end

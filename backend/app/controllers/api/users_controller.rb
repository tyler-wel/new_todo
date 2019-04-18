module Api
  class UsersController < ApplicationController
    #before_action :authorize_request, except: [:create]
    before_action :find_user, except: [:create, :index, :owned_boards]

    # GET /users
    def index
      @users = User.all
      render json: @users, status: :ok
    end

    # GET /users/{id}
    def show
      render json: @user, status: :ok
    end

    # GET /users/{id}/boards
    def owned_boards
      @user = User.find_by_id!(params[:user_id])
      puts @user
      render json: @user.owned_boards, status: :ok
    end

    # POST /users
    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: { errors: @user.errors.full_messages },
                      status: :unprocessable_entity
      end
    end

    # DELETE /users/{id}
    def destroy 
      @user.destroy
    end

    private

    def find_user
      @user = User.find_by_id!(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'User not found' }, status: :not_found
    end

    def find_user_alt
      @user = User.find_by_id!(params[:user_id])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'User not found' }, status: :not_found
    end
    
    def user_params
        params.permit(
          :name, :email, :password
        )
    end

  end
end

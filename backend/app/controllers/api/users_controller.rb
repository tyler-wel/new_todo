module Api
  class UsersController < ApplicationController
    #before_action :authorize_request, except: [:create]
    before_action :find_user, except: [:create, :index]

    # GET /users
    def index
      @users = User.all
      render json: @users, status: :ok
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

    # GET /users/{id}
    def show
      render json: @user, status: :ok
    end

    # DELETE /users/{id}
    def destroy 
      @user.destroy
    end

    private

    def user_params
      params.permit(
        :name, :email, :password
      )
    end

    def find_user
      @user = User.find_by_id!(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'User not found' }, status: :not_found
    end
    
    

  end
end

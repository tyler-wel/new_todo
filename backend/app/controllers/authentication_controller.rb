class AuthenticationController < ApplicationController
  before_action :authorize_request, except: [:login, :logout] 

  # POST /auth/login
  def login
    @user = User.find_by_email(params[:email])
    puts "EMAIL " + params[:email]
    puts "PASSWORD " + params[:password]
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      puts "TOKEN " + token
      render json: { authorization: token }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  # GET /auth/user
  def show 

    puts "CURRENT USER " + @current_user.name

    render json: { user: @current_user }, status: :ok

  end

  # POST /auth/logout
  def logout 
    puts "LOGGING OUT TODO"

    render json: { message: "logged out"}, status: :ok
  end

  private

  def login_params
    params.permit(:email, :password)
  end



end
class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:show, :update]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.create(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors }, status: :unprocessible_entity
    end
  end

  def update
    @user.update(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def login
    @user = User.all.find_by(username: params[:username])

    if @user.nil?
      render json: { type: "username", error: "Username not found" }, status: :error
    else
      if @user.authenticate(params[:password])
        render json: @user
      else
        render json: { type: "password", error: "Incorrect password" }, status: :error
      end
    end
  end

  private

  def user_params
    params.permit(:username, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end
end

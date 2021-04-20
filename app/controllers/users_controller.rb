class UsersController < ApplicationController
  def index
    @users = User.all

    render json: @users, 
           each_serializer: User::Index::UserSerializer, status: :ok 
  end
end

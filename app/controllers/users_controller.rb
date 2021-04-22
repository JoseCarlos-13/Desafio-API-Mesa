class UsersController < ApplicationController
  def update
    user = User.find(params[:id])

    if user.update(user_params)
      head :no_content
    else
      render json: { errors: user.errors }, status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

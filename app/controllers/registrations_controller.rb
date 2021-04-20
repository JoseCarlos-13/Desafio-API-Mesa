class RegistrationsController < DeviseTokenAuth::RegistrationsController
  skip_before_action :authenticate_user!

  def create
    @resource = User.new(user_params)

    if @resource.save
      render json: @resource, 
             serializer: User::Create::RegistrationSerializer, status: :created
    else
      render json: { errors: @resource.errors }, status: :unprocessable_entity
    end
  end

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end

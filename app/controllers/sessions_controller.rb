class SessionsController < DeviseTokenAuth::SessionsController
  skip_before_action :authenticate_user!

  def destroy
    head :no_content
  end
end

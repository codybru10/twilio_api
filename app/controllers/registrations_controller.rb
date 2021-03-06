class RegistrationsController < Devise::RegistrationsController
  private

    def sign_up_params
      params.require(:user).permit(:last_name, :first_name, :send_number, :receive_number, :email, :password, :password_confirmation)
    end

    def account_update_params
      params.require(:user).permit(:last_name, :first_name, :send_number, :receive_number, :email, :password, :password_confirmation, :current_password)
    end
end

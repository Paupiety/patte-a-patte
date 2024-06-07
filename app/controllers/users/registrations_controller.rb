module Users
    class RegistrationsController < Devise::RegistrationsController
      before_action :configure_sign_up_params, only: [:create]
  
      protected
  
      # Autoriser les paramètres supplémentaires pour l'inscription
      def configure_sign_up_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
      end
    end
  end
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize


  protected

    def authorize
      if request.format == Mime[:html]
        unless User.find_by(id: session[:user_id])
          redirect_to login_url, notice: "Please log in"
        end
      else
        authenticate_or_request_with_http_basic do |email, password|
          user = User.find_by(email: email)
          user && user.authenticate(password)
        end
      end
    end
end

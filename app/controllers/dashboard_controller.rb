class DashboardController < ApplicationController
  
  # GET /dashboard
  # GET /dashboard.json
  def index
  	
  end

  def change_client
  	if dashboard_params.client_id
  		session[:client_id] = dashboard_params.client_id
  	end
  end


private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dashboard_params
      params.require(:dashboard).permit(:client_id)
    end

end

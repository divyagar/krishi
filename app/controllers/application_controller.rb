class ApplicationController < ActionController::Base
  def current_user
    @current_user if @current_user
    if session[:current_farmer_id]
      @current_user = Farmer.find(session[:current_farmer_id])
      @usertype = "farmer"
    elsif session[:current_buyer_id]
      @current_user = Buyer.find(session[:current_buyer_id])
      @usertype = "buyer"
    end
  end
end

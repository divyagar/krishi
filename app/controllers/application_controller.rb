class ApplicationController < ActionController::Base
  def current_user
    # [@current_user, @usertype] if @current_user
    # @usertype if @usertype
    if session[:current_farmer_id]
      @current_user = Farmer.find(session[:current_farmer_id])
      @usertype = "farmer"
      [@current_user, @usertype]
    elsif session[:current_buyer_id]
      @current_user = Buyer.find(session[:current_buyer_id])
      @usertype = "buyer"
      [@current_user, @usertype]
    else
      []
    end
  end
end

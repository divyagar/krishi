class SessionsController < ApplicationController
  def create
    if params[:user] == "Farmer"
      farmer = Farmer.find_by(email: params[:email])
      if(farmer && farmer.authenticate(params[:password]))
        session[:current_farmer_id] = farmer.id
        redirect_to farmers_path
      else
        redirect_to new_farmer_path
      end        
    else
      buyer = Buyer.find_by(email: params[:email])
      if(buyer and buyer.authenticate(params[:password]))
        session[:current_buyer_id] = buyer.id
        redirect_to buyers_path
      else
        redirect_to new_buyer_path
      end
    end
  end

  def destroy
    lst = current_user
    puts @usertype
    if @usertype == "buyer"
      session[:current_buyer_id] = nil
      @usertype = nil
    else
      session[:current_farmer_id] = nil
      @usertype = nil
    end

    puts "done #{session[:current_buyer_id]}"
    redirect_to "/"
  end

end
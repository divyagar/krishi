class FarmersController < ApplicationController
  def new
    render "new"
  end

  def index
    lst = current_user
    @farmer = lst[0]
    @usertype = lst[1]
    @items = Item.where(farmer_id: @farmer.id)
    puts @items.count
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    phone = params[:phone]

    farmer = Farmer.new(
      name: name,
      email: email,
      password: password,
      phone: phone
    )

    if farmer.save
      session[:current_buyer_id] = farmer.id
      redirect_to farmers_path
    else
      flash[:error] = "Error while creating farmer"
      redirect_to farmers_path
    end
  end

  def show
    id = params[:id]
  end
end
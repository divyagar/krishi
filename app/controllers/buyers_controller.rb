class BuyersController < ApplicationController
  def new
    @page = "New buyer"
    render "new"
  end

  def index
    lst = current_user
    @buyer = lst[0]
    @usertype = lst[1]
    puts @buyer
    @orders = @buyer.orders
    @page = "Buyer dashboard"
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    address = params[:address]
    phone = params[:phone]

    buyer = Buyer.new(
      name: name,
      email: email,
      password: password,
      address: address,
      phone: phone
    )

    if buyer.save
      flash[:message] = "mew buyer created"
      session[:current_buyer_id] = buyer.id
      redirect_to buyers_path
    else
      flash[:message] = "error while creating buyer"
      redirect_to buyers_path
    end
  end
end
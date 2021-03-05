class BuyersController < ApplicationController
  def new
    render "new"
  end

  def index
    render plain: "#{flash[:message]}"
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
      redirect_to buyers_path
    else
      flash[:message] = "error while creating buyer"
      redirect_to buyers_path
    end
  end
end
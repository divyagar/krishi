class FarmersController < ApplicationController
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
    phone = params[:phone]

    farmer = Farmer.new(
      name: name,
      email: email,
      password: password,
      phone: phone
    )

    if farmer.save
      flash[:message] = "created"
      redirect_to farmers_path
    else
      flash[:message] = "error"
      redirect_to farmers_path
    end
  end

  def show
    id = params[:id]
  end
end
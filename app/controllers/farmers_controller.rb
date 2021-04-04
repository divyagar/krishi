class FarmersController < ApplicationController
  def new
    render "new"
  end

  def index
    lst = current_user
    @farmer = lst[0]
    @usertype = lst[1]
    @vegetables = Item.where("farmer_id= ? and itemtype= ?", @farmer.id, "Vegetable")
    @fruits = Item.where("farmer_id= ? and itemtype= ?", @farmer.id, "Fruit")
    @seeds = Item.where("farmer_id= ? and itemtype= ?", @farmer.id, "Seed")
    @vegetableCount = @vegetables.count
    @fruitCount = @fruits.count
    @seedCount = @seeds.count
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
class ItemsController < ApplicationController
    def new
        @page = "Farmer dashboard"
        current_user
    end

    def create
        current_user
        item = Item.new(
            name: params[:name],
            itemtype: params[:itemtype],
            quantity: params[:quantity],
            price_per_kilo: params[:price_per_kilo],
            farmer_id: @current_user.id
        )

        if item.save
            redirect_to farmers_path
        else
            redirect_to new_item_path
        end
    end
end
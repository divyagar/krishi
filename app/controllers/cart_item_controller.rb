class CartItemController < ApplicationController
    def new
        if params.key?(:type)
            if params.key?(:farmer)
                @items = Item.where("itemtype = ? and name = ? and farmer_id = ?", params[:type], params[:item_name], Farmer.where(name: params[:farmer]).ids[0])
            else
                @items = Item.where("itemtype = ?", params[:type])
            end

            if params[:type] == "Vegetable"
                render "buy_vegetables"
            elsif params[:type] == "Fruit"
                render "buy_fruits"
            elsif params[:type] == "Seed"
                render "buy_seeds"
            else
                redirect_to "/"
            end
            
        else
            redirect_to "/"
        end
    end

    def search
        redirect_to new_cart_item_path(type: params[:itemtype], item_name: params[:item_name], farmer: params[:farmer_name])
    end

end
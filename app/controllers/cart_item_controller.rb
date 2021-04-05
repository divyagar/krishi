class CartItemController < ApplicationController
    
    def index
        lst = current_user
        @current_user = lst[0]
        @items = CartItem.where(buyer_id: @current_user.id)
        @page = "Cart"
    end

    def new
        @page = "New cart item"
        if params.key?(:type)
            if params.key?(:farmer)
                @items = Item.where("itemtype = ? and name = ? and farmer_id = ?", params[:type], params[:item_name], Farmer.where(name: params[:farmer]).ids[0])
            else
                @items = Item.where("itemtype = ?", params[:type])
            end

            lst = current_user
            puts lst.length
            if lst.length == 0
                @current_user_id = ""
            else
                @current_user_id = lst[0].id
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

    def create
        item = CartItem.new(
            item_id: params[:itemid],
            quantity: params[:quantity],
            buyer_id: params[:buyerid]
        )

        if item.save
            redirect_to cart_item_index_path
        else
            redirect_to "/buy_vegetables"
        end

    end

end
class CartItemController < ApplicationController
    def new
        if params.key?(:type)
            if params[:type] == "vegetables"
                render "buy_vegetables"
            elsif params[:type] == "fruits"
                render "buy_fruits"
            elsif params[:type] == "seeds"
                render "buy_seeds"
            else
                render "/"
            end
        else
            render "/"
        end
    end

end
class CartItem < ActiveRecord::Base
    def new
        render "buy_vegetables"
    end

end
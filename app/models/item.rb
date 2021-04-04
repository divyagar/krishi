class Item < ActiveRecord::Base
    def getVegetables
        where(type: "Vegetable")
    end
end
class HomeController < ApplicationController

  def index
    @page = "Home"
    lst = current_user
    if lst.length == 0
      @current_user = nil
    else
      @current_user = lst[0]
    end
    render "index"
  end

end
class HomeController < ApplicationController
  def land
    if user_signed_in?
      redirect_to appeals_path
    else
      render layout: "land"
    end
  end

  def login 
  end
end

class HomeController < ApplicationController
  def land
    if user_signed_in?
      render :dashboard
    else
      render layout: "land"
    end
  end

  def login 
  end
end

class AppealsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:public]
      @public_list = true
      @appeals = Appeal.all
    else
      @appeals = current_user.appeals
    end
  end

  def new
    @appeal = current_user.appeals.new
  end

  def create
    @appeal = current_user.appeals.new(appeal_params)
    if @appeal.save
      redirect_to appeals_path, notice: "Appeal submitted successfully"
    else
      render 'edit'
    end
  end

  def show
    @appeal = Appeal.find(params[:id])
  end

  def stats
    
  end

private
  def appeal_params
    params.require(:appeal).permit(:appeal_type, :department, :subject, :description, :private)
  end
end

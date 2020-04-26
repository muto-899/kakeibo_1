class AprDatesController < ApplicationController
  
  def index
    @apr_dates = AprDate.all
    @date = DateTime.now
    @chart_date = AprDate.group(:category).sum(:pay)
  end
  
  def new
    @apr_date = AprDate.new
    @date = DateTime.now
  end
  
  def create
    @apr_date = AprDate.new(apr_date_params)
    if @apr_date.save
      redirect_to("/apr_dates/index")
    else 
      render 'new'
    end
  end
  
  def apr_date_params
    params.permit(:category, :pay)
  end

  def edit
  end
  
  def show
  end
  
  def update
  end
  
  def destroy
    @apr_date = AprDate.find_by(params[:id])
    @apr_date.destroy
    redirect_to("/apr_dates/index")
  end
  
end
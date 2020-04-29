class JulDatesController < ApplicationController
  
  def index
    @jul_dates = JulDate.all
    @date = DateTime.now
    @chart_date = JulDate.group(:pay_category).sum(:pay)
    @income_total =JulDate.sum(:income)
    @pay_total = JulDate.sum(:pay)
    @money_total = @income_total - @pay_total
  end
  
  def pay
    @jul_date = JulDate.new
    @date = DateTime.now
  end
  
  def income
    @jul_date = JulDate.new
    @date = DateTime.now
  end
  
  def create
    @jul_date = JulDate.new(jul_date_params)
    if @jul_date.save
      redirect_to("/jul_dates/index")
    else 
      render 'index'
    end
  end

  def edit
    @jul_date = JulDate.find_by(id: params[:id])
  end
  
  def show
    @jul_date = JulDate.find_by(id: params[:id])
  end
  
  def update
    @jul_date = JulDate.find_by(id: params[:id])
    if @jul_date.update(jul_date_params)
      redirect_to jul_dates_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @jul_date = JulDate.find_by(id: params[:id])
    @jul_date.destroy
    redirect_to("/jul_dates/index")
  end
  
  private
    def jul_date_params
      params.permit(:income_category, :income, :pay_category, :pay)
    end
    
end

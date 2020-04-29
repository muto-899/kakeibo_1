class FebDatesController < ApplicationController
  
  def index
    @feb_dates = FebDate.all
    @date = DateTime.now
    @chart_date = FebDate.group(:pay_category).sum(:pay)
    @income_total = FebDate.sum(:income)
    @pay_total = FebDate.sum(:pay)
    @money_total = @income_total - @pay_total
  end
  
  def pay
    @feb_date = FebDate.new
    @date = DateTime.now
  end
  
  def income
    @feb_date = FebDate.new
    @date = DateTime.now
  end
  
  def create
    @feb_date = FebDate.new(feb_date_params)
    if @feb_date.save
      redirect_to("/feb_dates/index")
    else 
      render 'index'
    end
  end

  def edit
    @feb_date = FebDate.find_by(id: params[:id])
  end
  
  def show
    @feb_date = FebDate.find_by(id: params[:id])
  end
  
  def update
    @feb_date = FebDate.find_by(id: params[:id])
    if @feb_date.update(feb_date_params)
      redirect_to feb_dates_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @feb_date = FebDate.find_by(id: params[:id])
    @feb_date.destroy
    redirect_to("/feb_dates/index")
  end
  
  private
    def feb_date_params
      params.permit(:income_category, :income, :pay_category, :pay)
    end
    
end

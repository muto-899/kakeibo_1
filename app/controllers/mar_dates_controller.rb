class MarDatesController < ApplicationController
  
  def index
    @mar_dates = MarDate.all
    @date = DateTime.now
    @chart_date = MarDate.group(:pay_category).sum(:pay)
    @income_total = MarDate.sum(:income)
    @pay_total = MarDate.sum(:pay)
    @money_total = @income_total - @pay_total
  end
  
  def pay
    @mar_date = MarDate.new
    @date = DateTime.now
  end
  
  def income
    @mar_date = MarDate.new
    @date = DateTime.now
  end
  
  def create
    @mar_date = MarDate.new(mar_date_params)
    if @mar_date.save
      redirect_to("/mar_dates/index")
    else 
      render 'index'
    end
  end

  def edit
    @mar_date = MarDate.find_by(id: params[:id])
  end
  
  def show
    @mar_date = MarDate.find_by(id: params[:id])
  end
  
  def update
    @mar_date = MarDate.find_by(id: params[:id])
    if @mar_date.update(mar_date_params)
      redirect_to mar_dates_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @mar_date = MarDate.find_by(id: params[:id])
    @mar_date.destroy
    redirect_to("/mar_dates/index")
  end
  
  private
    def mar_date_params
      params.permit(:income_category, :income, :pay_category, :pay)
    end
    
end

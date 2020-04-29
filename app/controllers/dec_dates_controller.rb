class DecDatesController < ApplicationController
  
  def index
    @dec_dates = DecDate.all
    @date = DateTime.now
    @chart_date = DecDate.group(:pay_category).sum(:pay)
    @income_total =DecDate.sum(:income)
    @pay_total = DecDate.sum(:pay)
    @money_total = @income_total - @pay_total
  end
  
  def pay
    @dec_date = DecDate.new
    @date = DateTime.now
  end
  
  def income
    @dec_date = DecDate.new
    @date = DateTime.now
  end
  
  def create
    @dec_date = DecDate.new(dec_date_params)
    if @dec_date.save
      redirect_to("/dec_dates/index")
    else 
      render 'index'
    end
  end

  def edit
    @dec_date = DecDate.find_by(id: params[:id])
  end
  
  def show
    @dec_date = DecDate.find_by(id: params[:id])
  end
  
  def update
    @dec_date = DecDate.find_by(id: params[:id])
    if @dec_date.update(dec_date_params)
      redirect_to dec_dates_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @dec_date = DecDate.find_by(id: params[:id])
    @dec_date.destroy
    redirect_to("/dec_dates/index")
  end
  
  private
    def dec_date_params
      params.permit(:income_category, :income, :pay_category, :pay)
    end
    
end

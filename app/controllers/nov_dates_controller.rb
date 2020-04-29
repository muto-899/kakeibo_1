class NovDatesController < ApplicationController
  
  def index
    @nov_dates = NovDate.all
    @date = DateTime.now
    @chart_date = NovDate.group(:pay_category).sum(:pay)
    @income_total =NovDate.sum(:income)
    @pay_total = NovDate.sum(:pay)
    @money_total = @income_total - @pay_total
  end
  
  def pay
    @nov_date = NovDate.new
    @date = DateTime.now
  end
  
  def income
    @nov_date = NovDate.new
    @date = DateTime.now
  end
  
  def create
    @nov_date = NovDate.new(nov_date_params)
    if @nov_date.save
      redirect_to("/nov_dates/index")
    else 
      render 'index'
    end
  end

  def edit
    @nov_date = NovDate.find_by(id: params[:id])
  end
  
  def show
    @nov_date = NovDate.find_by(id: params[:id])
  end
  
  def update
    @nov_date = NovDate.find_by(id: params[:id])
    if @nov_date.update(nov_date_params)
      redirect_to nov_dates_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @nov_date = NovDate.find_by(id: params[:id])
    @nov_date.destroy
    redirect_to("/nov_dates/index")
  end
  
  private
    def nov_date_params
      params.permit(:income_category, :income, :pay_category, :pay)
    end
    
end

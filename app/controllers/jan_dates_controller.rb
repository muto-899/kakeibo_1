class JanDatesController < ApplicationController
  
  def index
    @jan_dates = JanDate.all
    @date = DateTime.now
    @chart_date = JanDate.group(:pay_category).sum(:pay)
    @income_total = JanDate.sum(:income)
    @pay_total = JanDate.sum(:pay)
    @money_total = @income_total - @pay_total
  end
  
  def pay
    @jan_date = JanDate.new
    @date = DateTime.now
  end
  
  def income
    @jan_date = JanDate.new
    @date = DateTime.now
  end
  
  def create
    @jan_date = JanDate.new(jan_date_params)
    if @jan_date.save
      redirect_to("/jan_dates/index")
    else 
      render 'index'
    end
  end

  def edit
    @jan_date = JanDate.find_by(id: params[:id])
  end
  
  def show
    @jan_date = JanDate.find_by(id: params[:id])
  end
  
  def update
    @jan_date = JanDate.find_by(id: params[:id])
    if @jan_date.update(jan_date_params)
      redirect_to jan_dates_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @jan_date = JanDate.find_by(id: params[:id])
    @jan_date.destroy
    redirect_to("/jan_dates/index")
  end
  
  private
    def jan_date_params
      params.permit(:income_category, :income, :pay_category, :pay)
    end
    
end

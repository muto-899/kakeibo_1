class JunDatesController < ApplicationController
  
  def index
    @jun_dates = JunDate.all
    @date = DateTime.now
    @chart_date = JunDate.group(:pay_category).sum(:pay)
    @income_total = JunDate.sum(:income)
    @pay_total = JunDate.sum(:pay)
    @money_total = @income_total - @pay_total
  end
  
  def pay
    @jun_date = JunDate.new
    @date = DateTime.now
  end
  
  def income
    @jun_date = JunDate.new
    @date = DateTime.now
  end
  
  def create
    @jun_date = JunDate.new(jun_date_params)
    if @jun_date.save
      redirect_to("/jun_dates/index")
    else 
      render 'index'
    end
  end

  def edit
    @jun_date = JunDate.find_by(id: params[:id])
  end
  
  def show
    @jun_date = JunDate.find_by(id: params[:id])
  end
  
  def update
    @jun_date = JunDate.find_by(id: params[:id])
    if @jun_date.update(jun_date_params)
      redirect_to jun_dates_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @jun_date = JunDate.find_by(id: params[:id])
    @jun_date.destroy
    redirect_to("/jun_dates/index")
  end
  
  private
    def jun_date_params
      params.permit(:income_category, :income, :pay_category, :pay)
    end
    
end

class SepDatesController < ApplicationController
  
  def index
    @sep_dates = SepDate.all
    @date = DateTime.now
    @chart_date = SepDate.group(:pay_category).sum(:pay)
    @income_total = SepDate.sum(:income)
    @pay_total = SepDate.sum(:pay)
    @money_total = @income_total - @pay_total
  end
  
  def pay
    @sep_date = SepDate.new
    @date = DateTime.now
  end
  
  def income
    @sep_date = SepDate.new
    @date = DateTime.now
  end
  
  def create
    @sep_date = SepDate.new(sep_date_params)
    if @sep_date.save
      redirect_to("/sep_dates/index")
    else 
      render 'index'
    end
  end

  def edit
    @sep_date = SepDate.find_by(id: params[:id])
  end
  
  def show
    @sep_date = SepDate.find_by(id: params[:id])
  end
  
  def update
    @sep_date = SepDate.find_by(id: params[:id])
    if @sep_date.update(sep_date_params)
      redirect_to sep_dates_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @sep_date = SepDate.find_by(id: params[:id])
    @sep_date.destroy
    redirect_to("/sep_dates/index")
  end
  
  private
    def sep_date_params
      params.permit(:income_category, :income, :pay_category, :pay)
    end
    
end

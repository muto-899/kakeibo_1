class OctDatesController < ApplicationController
  
  def index
    @oct_dates = OctDate.all
    @date = DateTime.now
    @chart_date = OctDate.group(:pay_category).sum(:pay)
    @income_total = OctDate.sum(:income)
    @pay_total = OctDate.sum(:pay)
    @money_total = @income_total - @pay_total
  end
  
  def pay
    @oct_date = OctDate.new
    @date = DateTime.now
  end
  
  def income
    @oct_date = OctDate.new
    @date = DateTime.now
  end
  
  def create
    @oct_date = OctDate.new(oct_date_params)
    if @oct_date.save
      redirect_to("/oct_dates/index")
    else 
      render 'index'
    end
  end

  def edit
    @oct_date = OctDate.find_by(id: params[:id])
  end
  
  def show
    @oct_date = OctDate.find_by(id: params[:id])
  end
  
  def update
    @oct_date = OctDate.find_by(id: params[:id])
    if @oct_date.update(oct_date_params)
      redirect_to oct_dates_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @oct_date = OctDate.find_by(id: params[:id])
    @oct_date.destroy
    redirect_to("/oct_dates/index")
  end
  
  private
    def oct_date_params
      params.permit(:income_category, :income, :pay_category, :pay)
    end
    
end

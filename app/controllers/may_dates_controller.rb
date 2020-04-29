class MayDatesController < ApplicationController
  
  def index
    @may_dates = MayDate.all
    @date = DateTime.now
    @chart_date = MayDate.group(:pay_category).sum(:pay)
    @income_total = MayDate.sum(:income)
    @pay_total = MayDate.sum(:pay)
    @money_total = @income_total - @pay_total
  end
  
  def pay
    @may_date = MayDate.new
    @date = DateTime.now
  end
  
  def income
    @may_date = MayDate.new
    @date = DateTime.now
  end
  
  def create
    @may_date = MayDate.new(may_date_params)
    if @may_date.save
      redirect_to("/may_dates/index")
    else 
      render 'index'
    end
  end
  
  def may_date_params
    params.permit(:income_category, :income, :pay_category, :pay)
  end

  def edit
    @may_date = MayDate.find_by(id: params[:id])
  end
  
  def show
    @may_date = MayDate.find_by(id: params[:id])
  end
  
  def update
    @may_date = MayDate.find_by(id: params[:id])
    @may_date.pay = params[:pay]
    if @may_date.update(may_date_params)
      redirect_to may_dates_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @may_date = MayDate.find_by(id: params[:id])
    @may_date.destroy
    redirect_to("/may_dates/index")
  end
  
end

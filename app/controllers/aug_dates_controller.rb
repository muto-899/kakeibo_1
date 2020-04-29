class AugDatesController < ApplicationController
  
  def index
    @aug_dates = AugDate.all
    @date = DateTime.now
    @chart_date = AugDate.group(:pay_category).sum(:pay)
    @income_total =AugDate.sum(:income)
    @pay_total = AugDate.sum(:pay)
    @money_total = @income_total - @pay_total
  end
  
  def pay
    @aug_date = AugDate.new
    @date = DateTime.now
  end
  
  def income
    @aug_date = AugDate.new
    @date = DateTime.now
  end
  
  def create
    @aug_date = AugDate.new(aug_date_params)
    if @aug_date.save
      redirect_to("/aug_dates/index")
    else 
      render 'index'
    end
  end

  def edit
    @aug_date = AugDate.find_by(id: params[:id])
  end
  
  def show
    @aug_date = AugDate.find_by(id: params[:id])
  end
  
  def update
    @aug_date = AugDate.find_by(id: params[:id])
    if @aug_date.update(aug_date_params)
      redirect_to aug_dates_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @aug_date = AugDate.find_by(id: params[:id])
    @aug_date.destroy
    redirect_to("/aug_dates/index")
  end
  
  private
    def aug_date_params
      params.permit(:income_category, :income, :pay_category, :pay)
    end
    
end

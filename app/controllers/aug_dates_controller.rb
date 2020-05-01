class AugDatesController < ApplicationController
  before_action :authenticate_user!
  before_action :time_now
  
  def index
    @aug_dates = AugDate.where(user_id: current_user.id)
    @chart_date = AugDate.where(user_id: current_user.id).group(:pay_category).sum(:pay)
    @income_total =AugDate.where(user_id: current_user.id).sum(:income)
    @pay_total = AugDate.where(user_id: current_user.id).sum(:pay)
    @money_total = @income_total - @pay_total
  end
  
  def pay
    @aug_date = AugDate.new
  end
  
  def income
    @aug_date = AugDate.new
  end
  
  def create
    @aug_date = AugDate.new(
      user_id: current_user.id,
      income_category: params[:income_category],
      income: params[:income],
      pay_category: params[:pay_category],
      pay: params[:pay]
      )
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
      params.permit(:user_id, :income_category, :income, :pay_category, :pay)
    end
    
end

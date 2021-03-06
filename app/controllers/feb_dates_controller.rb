class FebDatesController < ApplicationController
  before_action :authenticate_user!
  before_action :time_now
  
  def index
    @feb_dates = FebDate.where(user_id: current_user.id)
    @chart_date = FebDate.where(user_id: current_user.id).group(:pay_category).sum(:pay)
    @income_total = FebDate.where(user_id: current_user.id).sum(:income)
    @pay_total = FebDate.where(user_id: current_user.id).sum(:pay)
    @money_total = @income_total - @pay_total
  end
  
  def pay
    @feb_date = FebDate.new
  end
  
  def income
    @feb_date = FebDate.new
  end
  
  def create
    @feb_date = FebDate.new(
      user_id: current_user.id,
      income_category: params[:income_category],
      income: params[:income],
      pay_category: params[:pay_category],
      pay: params[:pay]
      )
    if @feb_date.save
      redirect_to("/feb_dates/index")
    else 
      render 'index'
    end
  end

  def edit
    @feb_date = FebDate.find_by(id: params[:id])
  end
  
  def show
    @feb_date = FebDate.find_by(id: params[:id])
  end
  
  def update
    @feb_date = FebDate.find_by(id: params[:id])
    if @feb_date.update(feb_date_params)
      redirect_to feb_dates_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @feb_date = FebDate.find_by(id: params[:id])
    @feb_date.destroy
    redirect_to("/feb_dates/index")
  end
  
  private
    def feb_date_params
      params.permit(:user_id, :income_category, :income, :pay_category, :pay)
    end
    
end

class AprDatesController < ApplicationController
  before_action :authenticate_user!
  before_action :time_now
  
  def index
    @apr_dates = AprDate.where(user_id: current_user.id)
    @chart_date = AprDate.where(user_id: current_user.id).group(:pay_category).sum(:pay)
    @income_total = AprDate.where(user_id: current_user.id).sum(:income)
    @pay_total = AprDate.where(user_id: current_user.id).sum(:pay)
    @money_total = @income_total - @pay_total
  end
  
  def pay
    @apr_date = AprDate.new
  end
  
  def income
    @apr_date = AprDate.new
  end
  
  def create
    @apr_date = AprDate.new(
      user_id: current_user.id,
      income_category: params[:income_category],
      income: params[:income],
      pay_category: params[:pay_category],
      pay: params[:pay]
      )
    if @apr_date.save
      redirect_to("/apr_dates/index")
    else 
      render 'index'
    end
  end

  def edit
    @apr_date = AprDate.find_by(id: params[:id])
  end
  
  def show
    @apr_date = AprDate.find_by(id: params[:id])
  end
  
  def update
    @apr_date = AprDate.find_by(id: params[:id])
    if @apr_date.update(apr_date_params)
      redirect_to apr_dates_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @apr_date = AprDate.find_by(id: params[:id])
    @apr_date.destroy
    redirect_to("/apr_dates/index")
  end
  
  private
    def apr_date_params
      params.permit(:user_id, :income_category, :income, :pay_category, :pay)
    end
  
end
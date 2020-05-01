class JulDatesController < ApplicationController
  before_action :authenticate_user!
  before_action :time_now
  
  def index
    @jul_dates = JulDate.where(user_id: current_user.id)
    @chart_date = JulDate.where(user_id: current_user.id).group(:pay_category).sum(:pay)
    @income_total =JulDate.where(user_id: current_user.id).sum(:income)
    @pay_total = JulDate.where(user_id: current_user.id).sum(:pay)
    @money_total = @income_total - @pay_total
  end
  
  def pay
    @jul_date = JulDate.new
  end
  
  def income
    @jul_date = JulDate.new
  end
  
  def create
    @jul_date = JulDate.new(
      user_id: current_user.id,
      income_category: params[:income_category],
      income: params[:income],
      pay_category: params[:pay_category],
      pay: params[:pay]
      )
    if @jul_date.save
      redirect_to("/jul_dates/index")
    else 
      render 'index'
    end
  end

  def edit
    @jul_date = JulDate.find_by(id: params[:id])
  end
  
  def show
    @jul_date = JulDate.find_by(id: params[:id])
  end
  
  def update
    @jul_date = JulDate.find_by(id: params[:id])
    if @jul_date.update(jul_date_params)
      redirect_to jul_dates_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @jul_date = JulDate.find_by(id: params[:id])
    @jul_date.destroy
    redirect_to("/jul_dates/index")
  end
  
  private
    def jul_date_params
      params.permit(:user_id, :income_category, :income, :pay_category, :pay)
    end
    
end

class NovDatesController < ApplicationController
  before_action :authenticate_user!
  before_action :time_now
  
  def index
    @nov_dates = NovDate.where(user_id: current_user.id)
    @chart_date = NovDate.where(user_id: current_user.id).group(:pay_category).sum(:pay)
    @income_total =NovDate.where(user_id: current_user.id).sum(:income)
    @pay_total = NovDate.where(user_id: current_user.id).sum(:pay)
    @money_total = @income_total - @pay_total
  end
  
  def pay
    @nov_date = NovDate.new
  end
  
  def income
    @nov_date = NovDate.new
  end
  
  def create
    @nov_date = NovDate.new(
      user_id: current_user.id,
      income_category: params[:income_category],
      income: params[:income],
      pay_category: params[:pay_category],
      pay: params[:pay]
      )
    if @nov_date.save
      redirect_to("/nov_dates/index")
    else 
      render 'index'
    end
  end

  def edit
    @nov_date = NovDate.find_by(id: params[:id])
  end
  
  def show
    @nov_date = NovDate.find_by(id: params[:id])
  end
  
  def update
    @nov_date = NovDate.find_by(id: params[:id])
    if @nov_date.update(nov_date_params)
      redirect_to nov_dates_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @nov_date = NovDate.find_by(id: params[:id])
    @nov_date.destroy
    redirect_to("/nov_dates/index")
  end
  
  private
    def nov_date_params
      params.permit(:user_id, :income_category, :income, :pay_category, :pay)
    end
    
end
